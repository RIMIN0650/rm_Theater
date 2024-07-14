package com.rimin.theater.movie.service;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.rimin.theater.common.FileManager;
import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.dto.MovieDetail;
import com.rimin.theater.movie.repository.MovieRepository;

@Service
public class MovieService {
	@Autowired
	private MovieRepository movieRepository;
	
	public Movie addNewMovie(String title, String mainGenre 
							, String subGenre, String director, String ageOfView
							, int runTime, String country, String openingDay
							, String detail, MultipartFile file) {
		
		String filePath = FileManager.saveFile(title, file);
		
		Movie movie = Movie.builder()
							.title(title)
							.mainGenre(mainGenre)
							.subGenre(subGenre)
							.director(director)
							.ageOfView(ageOfView)
							.runTime(runTime)
							.country(country)
							.openingDay(openingDay)
							.detail(detail)
							.imagePath(filePath)
							.build();
		
		return movieRepository.save(movie);
	}
	
	
	// 등록된 영화 전체 목록 가져오기
	public List<MovieDetail> getMovieDetail(){
		
		List<Movie> movieList = movieRepository.findAll();
		
		List<MovieDetail> movieDetailList = new ArrayList<>();
		
		for(Movie movie:movieList) {
			MovieDetail movieDetail = MovieDetail.builder()
												.id(movie.getId())
												.title(movie.getTitle())
												.imagePath(movie.getImagePath())
												.age(movie.getAgeOfView())
												.mainGenre(movie.getMainGenre())
												.detail(movie.getDetail())
												.build();
			movieDetailList.add(movieDetail);
			
		}
		return movieDetailList;
		
	}
	
}
