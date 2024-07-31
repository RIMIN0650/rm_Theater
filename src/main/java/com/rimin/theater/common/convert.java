package com.rimin.theater.common;

public class convert {
	
	public static int convertTimeUnit(int time) {
		
		int totalMinutes = time;
		
		int convertedHours = totalMinutes / 60;
		int convertedMinutes = totalMinutes % 60;
		
		return (convertedHours * 100 + convertedMinutes);
		
	}
	
}
