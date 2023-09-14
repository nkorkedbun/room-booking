package com.paloit.meeting_room_booking.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.paloit.meeting_room_booking.model.request.CreateUserRequest;
import com.paloit.meeting_room_booking.model.response.UserResponse;
import com.paloit.meeting_room_booking.service.UserService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/user")
public class UserController {
    
    private final UserService userService;

    @PostMapping()
    public ResponseEntity<UserResponse> register(@RequestBody CreateUserRequest req){
        return ResponseEntity.status(HttpStatus.CREATED).body(userService.register(req));
    }
}
