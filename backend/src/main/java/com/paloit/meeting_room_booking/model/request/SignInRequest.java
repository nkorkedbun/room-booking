package com.paloit.meeting_room_booking.model.request;

import lombok.Data;

@Data
public class SignInRequest {
    
    private String email;
    private String password;
}
