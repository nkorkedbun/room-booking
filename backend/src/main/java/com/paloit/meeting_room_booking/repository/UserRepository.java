package com.paloit.meeting_room_booking.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paloit.meeting_room_booking.entity.User;

public interface UserRepository extends JpaRepository<User, Long> {
    
}
