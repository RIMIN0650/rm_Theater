package com.rimin.theater.runTime;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.service.RunTimeService;

@Controller
public class RunTimeController {
	
	@Autowired
	private RunTimeService runTimeService;
	
	@GetMapping("/runTime/showList")
	public String showRunTimeList() {
		return "manager/everyRunTimeList";
	}
	
	@GetMapping("/runTime/assign")
	public String assignMovieShowTime() {
		return "manager/assignShowTime";
	}
	
	// 관 별 상영시간 보여주기
	@GetMapping("/runTime/perRoom")
	public String runTimeperRoom(@RequestParam("roomName") String roomName
								, Model model) {
		
		// 리스트에 모든 상영 시간 추가
		List<RunTime> runTimeList = runTimeService.findShowTimeList(roomName);
		
		model.addAttribute(runTimeList);
		
		return "manager/runTimeList";
	}
}
