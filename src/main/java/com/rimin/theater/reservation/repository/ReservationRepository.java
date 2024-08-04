package com.rimin.theater.reservation.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.reservation.domain.Reservation;

public interface ReservationRepository extends JpaRepository<Reservation, Integer> {

}
