package com.rimin.theater.runTime.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class RunTimeDetail {
	
	private int runTimeId;
	private String roomName;
	private String movieName;
	private int startTime;
	private int endTime;
	private int totalSeat;
	private int reservedSeat;
	
}
