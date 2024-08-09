package com.rimin.theater.cinelink.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.cinelink.domain.CineLink;

public interface CineLinkRepository extends JpaRepository <CineLink, Integer> {
	
	/*
	// 관 등록되어 있는지 확인
	public int countByRoomName(String roomName);
	*/
	
	/*
	// 영화 등록되어 있는지 확인
	public int countByMovieName(String movieName);
	*/
	
	public CineLink findByRoomName(String roomName);
	
	public CineLink findByMovieName(String movieName);
	
	public List<CineLink> findAllByMovieName(String MovieName);
}
