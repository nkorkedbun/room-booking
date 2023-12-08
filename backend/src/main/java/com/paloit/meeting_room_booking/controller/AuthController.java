package com.paloit.meeting_room_booking.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paloit.meeting_room_booking.model.request.CreateUserRequest;
import com.paloit.meeting_room_booking.model.request.SignInRequest;
import com.paloit.meeting_room_booking.model.request.SigninWithRefreshTokenRequest;
import com.paloit.meeting_room_booking.model.response.SignInResponse;
import com.paloit.meeting_room_booking.model.response.UserResponse;
import com.paloit.meeting_room_booking.service.AuthService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/auth")
public class AuthController {

    private final AuthService service;

    @PostMapping("/signup")
    public ResponseEntity<UserResponse> register(@RequestBody CreateUserRequest request) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.register(request));
    }

    @PostMapping("/signin")
    public SignInResponse signin(@RequestBody SignInRequest request) {
        return service.signin(request);
    }

    @PostMapping("/signin/refresh")
    public SignInResponse signinWithRefresh(@RequestBody SigninWithRefreshTokenRequest request) {
        return service.signinWithRefreshToken(request);
    }
}
