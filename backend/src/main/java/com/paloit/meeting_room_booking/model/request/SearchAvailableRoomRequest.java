package com.paloit.meeting_room_booking.model.request;

import java.time.LocalDateTime;

import lombok.Data;

@Data
public class SearchAvailableRoomRequest {
    
    private Integer numberOfGuest;
    private LocalDateTime startTime;
    private LocalDateTime endTime;
    
}
