package com.paloit.meeting_room_booking.service;

import org.springframework.http.HttpStatus;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.AuthenticationException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.paloit.meeting_room_booking.entity.User;
import com.paloit.meeting_room_booking.model.request.CreateUserRequest;
import com.paloit.meeting_room_booking.model.request.SignInRequest;
import com.paloit.meeting_room_booking.model.request.SigninWithRefreshTokenRequest;
import com.paloit.meeting_room_booking.model.response.SignInResponse;
import com.paloit.meeting_room_booking.model.response.UserResponse;
import com.paloit.meeting_room_booking.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class AuthService {

    private final UserRepository userRepo;
    private final PasswordEncoder passwordEncoder;
    private final AccessTokenServiceImpl accessTokenService;
    private final RefreshTokenServiceImpl refreshTokenService;
    private final AuthenticationManager authenticationManager;

    public UserResponse register(CreateUserRequest request) {
        User newUser = User.builder().email(request.getEmail()).password(request.getPassword())
                .firstName(request.getFirstName()).lastName(request.getLastName()).build();
        newUser.setPassword(passwordEncoder.encode(request.getPassword()));
        newUser = userRepo.save(newUser);
        return new UserResponse(newUser);
    }

    public SignInResponse signin(SignInRequest request) {
        User user = userRepo.findByEmail(request.getEmail())
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid credentials"));
        try {
            authenticationManager.authenticate(
                    new UsernamePasswordAuthenticationToken(request.getEmail(), request.getPassword()));
        } catch (AuthenticationException e) {
            throw new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid credentials");
        }
        return SignInResponse.builder()
                .accessToken(accessTokenService.generateToken(user))
                .refreshToken(refreshTokenService.generateToken(user))
                .build();
    }

    public SignInResponse signinWithRefreshToken(SigninWithRefreshTokenRequest request) {
        String email = refreshTokenService.extractEmail(request.getRefreshToken());
        User user = userRepo.findByEmail(email)
                .orElseThrow(() -> new ResponseStatusException(HttpStatus.UNAUTHORIZED, "Invalid credentials"));
        return SignInResponse.builder()
                .accessToken(accessTokenService.generateToken(user))
                .refreshToken(refreshTokenService.generateToken(user))
                .build();
    }
}
