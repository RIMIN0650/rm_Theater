package com.rimin.theater.assign.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.assign.domain.AssignRoom;

public interface AssignRepository extends JpaRepository<AssignRoom, Integer> {
	
	
	
}
