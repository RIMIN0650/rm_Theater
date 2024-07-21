package com.rimin.theater.room.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.rimin.theater.room.domain.Room;

public interface RoomRepository extends JpaRepository<Room, Integer> {

}
