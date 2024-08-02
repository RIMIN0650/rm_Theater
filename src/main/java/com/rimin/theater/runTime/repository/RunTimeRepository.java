package com.rimin.theater.runTime.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.runTime.domain.RunTime;

public interface RunTimeRepository extends JpaRepository<RunTime, Integer> {
	
	// 관에 등록된 모든 상영시간 불러오기
	public List<RunTime> findAllByRoomName(String roomName);
	
	public RunTime findByStartTime(int startTime);
	
}
