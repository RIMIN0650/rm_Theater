package com.rimin.theater.common;

public class convert {
	
	public static int convertTimeUnit(int time) {
		
		int totalMinutes = time;
		
		int convertedHours = totalMinutes / 60;
		int convertedMinutes = totalMinutes % 60;
		
		return (convertedHours * 100 + convertedMinutes);
		
	}
	
	
	public static int returnEndTime(int startTime, int runTime) {
		
		int hour = ((startTime / 100) + (convert.convertTimeUnit(runTime)/100)) * 100;
		
		int minute = convert.convertTimeUnit((startTime % 100) + (convert.convertTimeUnit(runTime) % 100));
		
		return hour + minute;
	}
}
