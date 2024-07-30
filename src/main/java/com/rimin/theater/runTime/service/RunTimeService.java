package com.rimin.theater.runTime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.repository.MovieRepository;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;

@Service
public class RunTimeService {
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
	@Autowired
	private MovieRepository movieRepository;
	
	// 관 별 상영시간 확인
	public List<RunTime> findShowTimeList(String roomName){
		
		List<RunTime> runTimeList = runTimeRepository.findAllByRoomName(roomName);
		
		return runTimeList;
	}
	
	
	// 관 상영시간 추가
	public RunTime addRunTime(String roomName, int startTime) {
		
		// 연결된 리스트에서 관 이름으로 찾기
		CineLink cineLink = cineLinkRepository.findByRoomName(roomName);
		
		// 연결된 영화 이름 찾기
		String movieName = cineLink.getMovieName();
		
		// 영화 정보 불러오기
		Movie movie = movieRepository.findByTitle(movieName);
		
		// 영화 상영 시간 저장
		int movieRunTime = movie.getRunTime();
		
		RunTime runTime = RunTime.builder()
									.roomName(roomName)
									.startTime(startTime)
									.endTime(startTime + movieRunTime)
									.build();
		return runTimeRepository.save(runTime);
	}
}
