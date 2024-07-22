package com.rimin.theater.cinelink.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;

@Service
public class CineLinkService {
	
	@Autowired
	private CineLinkRepository cineLinkRepositroy;
	
	public CineLink linkRoomwithMovie(String roomName, String movieName) {
		
		CineLink cineLink = CineLink.builder()
								.roomName(roomName)
								.movieName(movieName)
								.build();
		
		return cineLinkRepositroy.save(cineLink);
	}
	
	
}
