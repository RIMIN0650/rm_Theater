package com.rimin.theater.movie.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

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
	
	// 영화 리스트 가져오기
	public List<MovieDetail> getMovieList(){
		
		// 데베에서 모든 movie 엔티티 조회
		List<Movie> movieList = movieRepository.findAll();
		
		// MovieDetail DTO 리스트 저장할 리스트 초기화 해주기
		List<MovieDetail> movieDetailList = new ArrayList<>();
		
		// 각 Movie 엔티티 순회하며 MovieDetail DTO로 변환
		// 각 엔티티에 대해 MovieDetail 객체 생성
		// builder 패턴 사용하여 MovieDetail 객체 빌드
		for(Movie movie : movieList) {
			
			MovieDetail movieDetail = MovieDetail.builder()
													.id(movie.getId())
													.title(movie.getTitle())
													.imagePath(movie.getImagePath())
													.age(movie.getAgeOfView())
													.mainGenre(movie.getMainGenre())
													.detail(null)
													.build();
			// 생성된 MovieDetail 객체를 리스트에 추가
			movieDetailList.add(movieDetail);
		}
		// MovieDetail DTO 리스트 반환
		return movieDetailList;
	}
	
	
	// 영화 제거하기
	public Movie deleteMovie(int id) {
		Optional<Movie> optionalMovie = movieRepository.findById(id);
		Movie movie = optionalMovie.orElse(null);
		
		if(movie != null) {
		FileManager.removeFile(movie.getImagePath());
		movieRepository.delete(movie);
		}
		
		return movie;
	}
	
	
	
}
