package com.rimin.theater.userSalt.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.userSalt.domain.UserSalt;

public interface UserSaltRepository extends JpaRepository<UserSalt, Integer> {

	public UserSalt findByUserId(String loginId);
	
}
