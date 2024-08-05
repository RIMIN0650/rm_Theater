package com.rimin.theater.reservation;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.reservation.domain.Reservation;
import com.rimin.theater.reservation.service.ReservationService;

@RestController
public class ReservationRestController {
	
	@Autowired
	private ReservationService reservationService;
	
	// 사용자별 예매하기
	@PostMapping("/reservation/add")
	public Map<String, String> makeReservation(@RequestParam("userId") int userId
												, @RequestParam("runTimeId") int runTimeId
												, @RequestParam("countAdult") int countAdult
												, @RequestParam("countJunior") int countJunior
												, @RequestParam("countSenior") int countSenior
												, @RequestParam("countDisabled") int countDisabled){
		
		Reservation reservation = reservationService.addReservation(userId, runTimeId, countAdult, countJunior, countSenior, countDisabled);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(reservation != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
	
	// 예매 내역 삭제하기
	@DeleteMapping("/reservation/delete")
	public Map<String, String> deleteReservation(@RequestParam("id") int id){
		
		Reservation reservation = reservationService.deleteReservation(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(reservation != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	}
}
