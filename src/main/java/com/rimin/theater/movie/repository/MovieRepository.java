package com.rimin.theater.movie.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.movie.domain.Movie;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
	
}
