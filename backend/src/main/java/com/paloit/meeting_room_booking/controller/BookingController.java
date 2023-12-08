package com.paloit.meeting_room_booking.controller;

import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paloit.meeting_room_booking.constant.CustomHeader;
import com.paloit.meeting_room_booking.model.MutableHttpServletRequest;
import com.paloit.meeting_room_booking.service.BookingService;

import jakarta.servlet.http.HttpServletRequest;
import lombok.RequiredArgsConstructor;

@RestController
@RequestMapping("/api/v1/booking")
@RequiredArgsConstructor
public class BookingController {

    private final BookingService service;

    @DeleteMapping("/{id}")
    public void deleteBooking(@PathVariable Long bookingId,
            @RequestHeader(value = "Authorization", required = false) String token,
            HttpServletRequest request) {
        MutableHttpServletRequest mutableRequest = new MutableHttpServletRequest(request);
        Long userId = Long.valueOf(mutableRequest.getHeader(CustomHeader.X_USER_ID.getValue()));
        service.deleteBooking(bookingId);
    }
}
