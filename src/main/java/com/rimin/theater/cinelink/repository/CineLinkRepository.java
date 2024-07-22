package com.rimin.theater.cinelink.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.cinelink.domain.CineLink;

public interface CineLinkRepository extends JpaRepository <CineLink, Integer> {

}
