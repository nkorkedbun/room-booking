package com.paloit.meeting_room_booking.service;

import org.springframework.stereotype.Service;

import com.paloit.meeting_room_booking.entity.User;
import com.paloit.meeting_room_booking.model.request.CreateUserRequest;
import com.paloit.meeting_room_booking.model.response.UserResponse;
import com.paloit.meeting_room_booking.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class UserService {

    private final UserRepository userRepo;

    public UserResponse register(CreateUserRequest req) {
        User newUser = User.builder().email(req.getEmail()).password(req.getPassword())
                .firstName(req.getFirstName()).lastName(req.getLastName()).build();
        newUser = userRepo.save(newUser);
        return new UserResponse(newUser);
    }
}
