package com.rimin.theater.manager.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.manager.domain.Manager;

public interface ManagerRepository extends JpaRepository<Manager, Integer> {
	
	public int countByLoginId(String loginId);
	
	public Manager findByLoginIdAndPassword(String loginId, String password);
}
