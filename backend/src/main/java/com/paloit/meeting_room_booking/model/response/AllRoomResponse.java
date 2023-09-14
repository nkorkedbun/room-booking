package com.paloit.meeting_room_booking.model.response;

import java.util.List;

import lombok.Data;

@Data
public class AllRoomResponse {
    
    private List<RoomResponse> rooms;
}
