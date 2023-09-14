package com.paloit.meeting_room_booking.repository;

import org.springframework.data.jpa.repository.JpaRepository;

import com.paloit.meeting_room_booking.entity.Booking;

public interface BookingRepository  extends JpaRepository<Booking, Long> {
    
}
