package com.rimin.theater.runTime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;

@Service
public class RunTimeService {
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	
	// 관 별 상영시간 확인
	public List<RunTime> findShowTimeList(String roomName){
		
		List<RunTime> runTimeList = runTimeRepository.findAllByRoomName(roomName);
		
		return runTimeList;
	}
	
}
