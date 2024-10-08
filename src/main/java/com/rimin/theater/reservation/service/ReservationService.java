package com.rimin.theater.reservation.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.repository.MovieRepository;
import com.rimin.theater.reservation.domain.Reservation;
import com.rimin.theater.reservation.dto.ReservationDetail;
import com.rimin.theater.reservation.repository.ReservationRepository;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;
import com.rimin.theater.viewerAge.domain.ViewerAge;
import com.rimin.theater.viewerAge.repository.ViewerAgeRepository;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
	@Autowired
	private MovieRepository movieRepository;
	
	@Autowired
	private ViewerAgeRepository viewerAgeRepository;
	
	// 예매하기
	public Reservation addReservation(int userId, int runTimeId, int countAdult
										, int countJunior, int countSenior, int countDisabled) {
		
		Reservation reservation = Reservation.builder()
												.userId(userId)
												.runTimeId(runTimeId)
												.countAdult(countAdult)
												.countJunior(countJunior)
												.countSenior(countSenior)
												.countDisabled(countDisabled)
												.build();
		
		Optional<RunTime> optionalRunTime = runTimeRepository.findById(runTimeId);
		RunTime runTime = optionalRunTime.orElse(null);
		
		int totalReservationCount = countAdult + countJunior + countSenior + countDisabled;
		
		if(runTime != null) {
			runTime = runTime.toBuilder()
								.reservedSeat(runTime.getReservedSeat() + totalReservationCount)
								.build();
								
			runTime = runTimeRepository.save(runTime);
		}
		
		reservationRepository.save(reservation);
		
		// 영화 viewerAge 테이블에 나이 분류 별 관객 수 추가
		CineLink cineLink = cineLinkRepository.findByRoomName(runTime.getRoomName());
		
		Movie movie = movieRepository.findByTitle(cineLink.getMovieName());
		
		ViewerAge viewerAge = viewerAgeRepository.findByMovieId(movie.getId());
		
		if(viewerAge != null) {
			viewerAge = viewerAge.toBuilder()
						.countAdult(viewerAge.getCountAdult() + countAdult)
						.countJunior(viewerAge.getCountJunior() + countJunior)
						.countSenior(viewerAge.getCountSenior() + countSenior)
						.countDisabled(viewerAge.getCountDisabled() + countDisabled)
						.build();
			
			viewerAgeRepository.save(viewerAge);
		}
		
		return reservation;
		
	}
	
	
	
	
	// 사용자별 과거 예매 목록 불러오기
	public List<ReservationDetail> findByUserId(int userId) {
		
		List<Reservation> reservationList = reservationRepository.findAllByUserId(userId);
		
		List<ReservationDetail> reservationDetailList = new ArrayList<>();
		
		for(Reservation reservation:reservationList) {
			
			Optional<RunTime> optionalRunTime = runTimeRepository.findById(reservation.getRunTimeId());
			RunTime runTime = optionalRunTime.orElse(null);
			
			CineLink cineLink = cineLinkRepository.findByRoomName(runTime.getRoomName());
			
			int totalPrice = (reservation.getCountAdult() * 12000)
								+ (reservation.getCountJunior() * 8000)
								+ (reservation.getCountSenior() * 5000)
								+ (reservation.getCountDisabled() * 3000);
			
			ReservationDetail reservationDetail = ReservationDetail.builder()
																	.reservationId(reservation.getId())
																	.movieTitle(cineLink.getMovieName())
																	.roomName(runTime.getRoomName())
																	.startTime(runTime.getStartTime())
																	.countAdult(reservation.getCountAdult())
																	.countJunior(reservation.getCountJunior())
																	.countSenior(reservation.getCountSenior())
																	.countDisabled(reservation.getCountDisabled())
																	.totalPrice(totalPrice)
																	.build();
																	
			reservationDetailList.add(reservationDetail);
		}
		
		return reservationDetailList;
		
	}
	
	// 예매 내역 제거하기
	public Reservation deleteReservation(int id) {
		Optional<Reservation> optionalReservation = reservationRepository.findById(id);
		Reservation reservation = optionalReservation.orElse(null);
		
		// 예약된 총 좌석 수 구하기
		int totalReservedCount = reservation.getCountAdult()
							+ reservation.getCountJunior()
							+ reservation.getCountSenior()
							+ reservation.getCountDisabled();

		// 빠졌던 좌석 수를 채우기 runTime 조회
		Optional<RunTime> optionalRunTime = runTimeRepository.findById(reservation.getRunTimeId());
		RunTime runTime = optionalRunTime.orElse(null);
		
		// 예약된 좌석 수 = 예약된 좌석 수 - 사용자가 예약했던 좌석 수
		if(runTime != null) {
			runTime = runTime.toBuilder()
								.reservedSeat(runTime.getReservedSeat()-totalReservedCount)
								.build();
			
			runTime = runTimeRepository.save(runTime);
		}
		
		if(reservation != null) {
			reservationRepository.delete(reservation);
		}
		
		return reservation;
	}
	
	
	// id로 연령 별 조회 위해
	public Reservation findByRunTimeId(int id) {
		Reservation reservation = reservationRepository.findByRunTimeId(id);
		
		
		return reservation;
	}
	
}
