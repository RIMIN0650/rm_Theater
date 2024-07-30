package com.rimin.theater.runTime;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;

import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.service.RunTimeService;

@RestController
public class RunTimeRestController {
	
	@Autowired
	private RunTimeService runTimeService;
	
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
	
	
	
	
}
