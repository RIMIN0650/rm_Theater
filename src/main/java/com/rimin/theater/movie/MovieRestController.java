package com.rimin.theater.movie;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import com.rimin.theater.movie.domain.Movie;
import com.rimin.theater.movie.service.MovieService;

@RestController
public class MovieRestController {
	
	
	@Autowired
	private MovieService movieService;
	
	@PostMapping("/movie/addMovie")
	public Map<String, String> addMovie(@RequestParam("title") String title
										, @RequestParam("mainGenre") String mainGenre
										, @RequestParam("subGenre") String subGenre
										, @RequestParam("director") String director
										, @RequestParam("ageOfView") String ageOfView
										, @RequestParam("runTime") int runTime
										, @RequestParam("country") String country
										, @RequestParam("openingDay") String openingDay
										, @RequestParam("detail") String detail
										, @RequestParam("imageFile") MultipartFile imageFile){
		
		Movie movie = movieService.addNewMovie(title, mainGenre, subGenre, director
												, ageOfView, runTime, country
												, openingDay, detail, imageFile);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(movie != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		}
		return resultMap;
		
	}
	
	
	
	// 영화 삭제
	@DeleteMapping("/movie/delete")
	public Map<String, String> deleteMovie(@RequestParam("id") int id){
		
		Movie movie = movieService.deleteMovie(id);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(movie != null) {
			resultMap.put("result", "success");
		} else {
			resultMap.put("result", "fail");
		}
		return resultMap;
	}
	
	
	
	// 영화 상세정보 수정 api
	@PutMapping("/movie/update")
	public Map<String, String> updateMovie(@RequestParam("id") int id
											, @RequestParam("title") String title
											, @RequestParam("mainGenre") String mainGenre
											, @RequestParam("subGenre") String subGenre
											, @RequestParam("director") String director
											, @RequestParam("ageOfView") String ageOfView
											, @RequestParam("runTime") int runTime
											, @RequestParam("country") String country
											, @RequestParam("openingDay") String openingDay
											, @RequestParam("detail") String detail
											, @RequestParam(value = "imageFile", required = false) MultipartFile imageFile
											, @RequestParam(value = "existingImagePath", required = false) String existingImagePath){
		Movie movie = movieService.updateMovie(id, title, mainGenre, subGenre, director, ageOfView, runTime
												, country, openingDay, detail, imageFile, existingImagePath);
		
		Map<String, String> resultMap = new HashMap<>();
		
		if(movie != null) {
			resultMap.put("result",  "success");
		} else {
			resultMap.put("result",  "fail");
		} 
		return resultMap;
	}
	
}
