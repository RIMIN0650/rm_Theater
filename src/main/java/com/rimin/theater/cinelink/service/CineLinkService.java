package com.rimin.theater.cinelink.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;

@Service
public class CineLinkService {
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
	public CineLink linkRoomwithMovie(String roomName, String movieName) {
		
		CineLink cineLink = CineLink.builder()
								.roomName(roomName)
								.movieName(movieName)
								.build();
		
		return cineLinkRepository.save(cineLink);
	}
	
	
	// 이미 등록되어 있는 관인지 확인
	public boolean isDuplicateRoom(String roomName) {
		
		int count = cineLinkRepository.countByRoomName(roomName);
		
		if(count != 0) {
			return true; // 중복
		} else {
			return false;
		}
		
		
	}
	
	// 이미 등록되어 있는 영화인지 확인
	public boolean isDuplicateMovie(String movieName) {
		int count = cineLinkRepository.countByMovieName(movieName);
		
		if(count != 0) {
			return true; // 중복
		} else {
			return false;
		}
		
	}
	
	
	
}
