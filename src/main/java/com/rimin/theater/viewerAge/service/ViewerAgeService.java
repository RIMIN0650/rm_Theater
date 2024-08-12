package com.rimin.theater.viewerAge.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.rimin.theater.viewerAge.domain.ViewerAge;
import com.rimin.theater.viewerAge.repository.ViewerAgeRepository;

@Service
public class ViewerAgeService {
	
	@Autowired 
	private ViewerAgeRepository viewerAgeRepository;
	
	public ViewerAge addViewerCount(int movieId, int countAdult, int countJunior
								, int countSenior, int countDisabled) {
		
		ViewerAge viewerAge = viewerAgeRepository.findByMovieId(movieId);
		
		if(viewerAge != null) {
			viewerAge.toBuilder()
						.countAdult(viewerAge.getCountAdult() + countAdult)
						.countJunior(viewerAge.getCountJunior() + countJunior)
						.countSenior(viewerAge.getCountSenior() + countSenior)
						.countDisabled(viewerAge.getCountDisabled() + countDisabled)
						.build();
		}
		return viewerAgeRepository.save(viewerAge);
		
	}
	
}
