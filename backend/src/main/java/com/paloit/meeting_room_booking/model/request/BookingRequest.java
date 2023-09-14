package com.paloit.meeting_room_booking.model.request;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class BookingRequest {
    
    private LocalDateTime startTime;
    private LocalDateTime endTime;
}
