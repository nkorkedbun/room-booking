package com.paloit.meeting_room_booking.service;

import org.springframework.security.core.userdetails.UserDetails;

import com.paloit.meeting_room_booking.entity.User;

public interface JwtService {

    String extractEmail(String token);

    Long extractUserId(String token);

    String generateToken(User user);

    boolean isTokenValid(String token, UserDetails userDetails);
}
