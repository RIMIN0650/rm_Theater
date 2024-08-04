package com.rimin.theater.reservation.service;

import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.reservation.domain.Reservation;
import com.rimin.theater.reservation.repository.ReservationRepository;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;

@Service
public class ReservationService {
	
	@Autowired
	private ReservationRepository reservationRepository;
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	
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
	
}
