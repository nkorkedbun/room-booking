package com.paloit.meeting_room_booking.service;

import org.springframework.stereotype.Service;

import com.paloit.meeting_room_booking.repository.BookingRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class BookingService {
    
    private final BookingRepository bookingRepo;

    public void deleteBooking(Long bookingId){
        bookingRepo.deleteById(bookingId);
    }
}
