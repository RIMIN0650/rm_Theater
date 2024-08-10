package com.rimin.theater.reservation.repository;

import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.reservation.domain.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {
	
	List<Reservation> findAllByUserId(int UserId);
	
	public Reservation findByRunTimeId(int id);
}
