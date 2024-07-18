package com.rimin.theater.movie.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.movie.domain.Movie;

public interface MovieRepository extends JpaRepository<Movie, Integer> {
	
	// 메인 페이지에 보여줄 포스터 5개 조회
	public List<Movie> findTop5ByOrderById();
	
}
