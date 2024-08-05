package com.rimin.theater.reservation.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class ReservationDetail {
	int reservationId;
	String movieTitle;
	String roomName;
	int startTime;
	int countAdult;
	int countJunior;
	int countSenior;
	int countDisabled;
	int totalPrice;
}
