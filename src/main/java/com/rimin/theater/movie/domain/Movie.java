package com.rimin.theater.movie.domain;

import java.util.Date;

import org.hibernate.annotations.UpdateTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Getter;
import lombok.NoArgsConstructor;

@Builder
@NoArgsConstructor
@AllArgsConstructor
@Getter
@Table(name="movie")
@Entity
public class Movie {
	@Id
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	private String title;
	
	@Column(name="imagePath")
	private String imagePath;
	
	@Column(name="mainGenre")
	private String mainGenre;
	
	@Column(name="subGenre")
	private String subGenre;
	
	private String director;
	
	@Column(name="ageOfView")
	private String ageOfView;
	
	@Column(name="runTime")
	private int runTime;
	
	private String country;
	
	@Column(name="openingDay")
	private String openingDay;
	
	private String detail;
	
	@UpdateTimestamp
	@Column(name="createdAt", updatable=false)
	private Date createdAt;
	
	@UpdateTimestamp
	@Column(name="updatedAt")
	private Date updatedAt;
}
