package com.rimin.theater.viewerAge.repository;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.stereotype.Repository;

import com.rimin.theater.viewerAge.domain.ViewerAge;

@Repository
public interface ViewerAgeRepository extends JpaRepository <ViewerAge, Integer> {
	
	public ViewerAge findByMovieId(int movieId);
	
}
