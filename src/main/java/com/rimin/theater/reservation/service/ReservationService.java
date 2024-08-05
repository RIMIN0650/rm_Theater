package com.rimin.theater.reservation.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.reservation.domain.Reservation;
import com.rimin.theater.reservation.repository.ReservationRepository;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;
import com.rimin.theater.user.ReservationDetail;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
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
		
		return reservationRepository.save(reservation);
		
	}
	
	
	public List<ReservationDetail> findByUserId(int userId) {
		
		List<Reservation> reservationList = reservationRepository.findAllByUserId(userId);
		
		List<ReservationDetail> reservationDetailList = new ArrayList<>();
		
		for(Reservation reservation:reservationList) {
			
			Optional<RunTime> optionalRunTime = runTimeRepository.findById(reservation.getRunTimeId());
			RunTime runTime = optionalRunTime.orElse(null);
			
			CineLink cineLink = cineLinkRepository.findByRoomName(runTime.getRoomName());
			
			ReservationDetail reservationDetail = ReservationDetail.builder()
																	.reservationId(reservation.getId())
																	.movieTitle(cineLink.getMovieName())
																	.roomName(runTime.getRoomName())
																	.startTime(runTime.getStartTime())
																	.countAdult(reservation.getCountAdult())
																	.countJunior(reservation.getCountJunior())
																	.countSenior(reservation.getCountSenior())
																	.countDisabled(reservation.getCountDisabled())
																	.build();
																	
			reservationDetailList.add(reservationDetail);
		}
		
		return reservationDetailList;
		
	}
}
