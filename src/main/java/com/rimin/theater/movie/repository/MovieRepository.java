package com.rimin.theater.movie.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.movie.domain.Movie;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
	
	public List<Movie> findTop5ByOrderById();
	
}
