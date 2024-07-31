package com.rimin.theater.runTime.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.common.convert;
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
		
		// 영화시간 + 상영시간 했을 때 60분 이상 > 시간 분 으로 표시하도록
		int hour = ((startTime / 100) + (convert.convertTimeUnit(movie.getRunTime()) / 100)) * 100;
		
		int minute = convert.convertTimeUnit((startTime % 100) 
												+ (convert.convertTimeUnit(movie.getRunTime()) % 100));
		
		RunTime runTime = RunTime.builder()
									.roomName(roomName)
									.startTime(startTime)
									.endTime(hour + minute)
									.build();
		return runTimeRepository.save(runTime);
	}
	
	// 영화 상영시간 정보 확인
	
	public Boolean availableRunTime(String roomName, int startTime) {
		
		List<RunTime> runTimeList = runTimeRepository.findAllByRoomName(roomName);
		
		CineLink cineLink = cineLinkRepository.findByRoomName(roomName);
		
		// 연결된 영화 이름 찾기
		String movieName = cineLink.getMovieName();
				
		// 영화 정보 불러오기
		Movie movie = movieRepository.findByTitle(movieName);
		
		// 모든 상영시간 중
		for(RunTime runTime:runTimeList) {
			// 입력한 시작시간이 등록된 시작시간 + 영화 runTime + 20분 보다 작거나
			if(startTime < runTime.getStartTime() + (movie.getRunTime()+20)
					// 입력한 시작시간이 등록된 시작시간 - (영화 runtime + 20분) 보다 작으면
					|| startTime > runTime.getStartTime() - (movie.getRunTime()+20)) {
				// 등록 불가
				return false;
			}
			
		}
		
		return true;
	}
	
}
