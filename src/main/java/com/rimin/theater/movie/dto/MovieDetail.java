package com.rimin.theater.movie.dto;

import lombok.Builder;
import lombok.Getter;

@Builder
@Getter
public class MovieDetail {
	private int id;
	private String title;
	private String imagePath;
	private String age;
	private String mainGenre;
	private String detail;
}
