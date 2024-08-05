package com.rimin.theater.movie.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.rimin.theater.cinelink.domain.CineLink;
import com.rimin.theater.cinelink.repository.CineLinkRepository;
import com.rimin.theater.common.FileManager;
import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.dto.MovieDetail;
import com.rimin.theater.movie.repository.MovieRepository;
import com.rimin.theater.runTime.domain.RunTime;
import com.rimin.theater.runTime.repository.RunTimeRepository;

@Service
public class MovieService {
	@Autowired
	private MovieRepository movieRepository;
	
	@Autowired
	private CineLinkRepository cineLinkRepository;
	
	@Autowired
	private RunTimeRepository runTimeRepository;
	
	// 영화 신규 등록
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
	// 메인 페이지에 보여주기 위함
	public List<MovieDetail> getMovieDetail(){
		
		// 현재는 id 순으로 가져왔지만
		// 이후에 예매수나 다른 데이터를 통해 나열하여 가져올 예정
		List<Movie> movieList = movieRepository.findTop5ByOrderById();
		
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
		
		// 상영중인 영화 시간 같이 제거하기
		CineLink cineLink = cineLinkRepository.findByMovieName(movie.getTitle());
		
		List<RunTime> runTimeList = runTimeRepository.findAllByRoomName(cineLink.getRoomName());
		
		for(RunTime runTime : runTimeList) {
			runTimeRepository.delete(runTime);
		}
		
		// 영화 제거하기
		if(movie != null) {
		FileManager.removeFile(movie.getImagePath());
		movieRepository.delete(movie);
		}
		
		return movie;
	}
	
	// 영화 상세정보 불러오기
	public Movie getMovieInfo(int id) {
		Optional<Movie> optionalMovie = movieRepository.findById(id);
		
		Movie movie = optionalMovie.orElse(null);
		return movie;
	}
	
	// 영화 상세 정보 수정
	public Movie updateMovie(int id, String title, String mainGenre 
							, String subGenre, String director, String ageOfView
							, int runTime, String country, String openingDay
							, String detail, MultipartFile file, String existingImagePath ) {
		Optional<Movie> optionalMovie = movieRepository.findById(id);
		Movie movie = optionalMovie.orElse(null);
		
		CineLink cineLink = cineLinkRepository.findByMovieName(title);
		if(cineLink != null) {
			cineLink = cineLink.toBuilder()
								.movieName(title)
								.build();
		}
		
		String filePath = FileManager.saveFile(title, file, existingImagePath);
		
		if(movie != null) {
			// toBuilder : lombok 라이브러리를 사용하는 경우 객체를 수정하기 위해 사용
			
			FileManager.removeFile(movie.getImagePath()); // 기존에 저장된 파일을 지우기 위해
			
			movie = movie.toBuilder()
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
			movie = movieRepository.save(movie);
		}
		return movie;
	}
	
	
	// 영화 이름으로 정보 조회
	public Movie findMovie(String movieName) {
		
		Movie movie = movieRepository.findByTitle(movieName);
		
		return movie;
	}
	
}
