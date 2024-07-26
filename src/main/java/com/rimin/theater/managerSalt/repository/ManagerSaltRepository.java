package com.rimin.theater.managerSalt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.managerSalt.domain.ManagerSalt;

public interface ManagerSaltRepository extends JpaRepository<ManagerSalt, Integer> {
	
	public ManagerSalt findByManagerId(String loginId);
	
}
