package com.paloit.meeting_room_booking.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paloit.meeting_room_booking.service.BookingService;

import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/booking")
@RequiredArgsConstructor
public class BookingController {
    
    private final BookingService service;

    @DeleteMapping("/{id}")
    public void deleteBooking(Long bookingId){
        service.deleteBooking(bookingId);
    }
}
