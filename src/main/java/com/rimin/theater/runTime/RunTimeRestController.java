package com.rimin.theater.runTime;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.service.RunTimeService;

@RestController
public class RunTimeRestController {
	
	@Autowired
	private RunTimeService runTimeService;
	
	
	// 상영 시간 등록하기
	@PostMapping("/runTime/assign")
	public Map<String, String> assignMovieRunTime(@RequestParam("roomName") String roomName
													, @RequestParam("startTime") int startTime){
		
		RunTime runTime = runTimeService.addRunTime(roomName, startTime);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(runTime != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	// 상영시간 등록할 수 있는지 확인하기
	@PostMapping("/runTime/available")
	public Map<String, Boolean> possibleRunTime(@RequestParam("roomName")String roomName
												, @RequestParam("startTime") int startTime){
		
		boolean isAvailable = runTimeService.availableRunTime(roomName, startTime);
		
		Map<String, Boolean> resultMap = new HashMap<>();
		
		resultMap.put("isAvailable", isAvailable);
		
		return resultMap;
		
	}
	
	@DeleteMapping("/runTime/delete")
	public Map<String, String> deleterunTime(@RequestParam("startTime") int startTime){
		
		RunTime runTime = runTimeService.deleteRunTime(startTime);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(runTime != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		
		return resultMap;
	
	}
	
}
