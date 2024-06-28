package com.rimin.theater.user.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.user.domain.User;

public interface UserRepository extends JpaRepository<User, Integer>{

}
