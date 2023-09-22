package com.paloit.meeting_room_booking.controller;

import java.time.LocalDate;
import java.time.LocalTime;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestHeader;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.server.ResponseStatusException;

import com.fasterxml.jackson.annotation.JsonFormat;
import com.paloit.meeting_room_booking.model.request.BookingRequest;
import com.paloit.meeting_room_booking.model.request.CreateRoomRequest;
import com.paloit.meeting_room_booking.model.response.RoomResponse;
import com.paloit.meeting_room_booking.service.RoomService;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@RestController
@RequestMapping("/api/v1/room")
public class RoomController {

    private final RoomService service;

    @GetMapping()
    public ResponseEntity<List<RoomResponse>> getRooms(
            @RequestParam(required = false, name = "date") String date,
            @RequestParam(required = false, name = "start_time") String startTime,
            @RequestParam(required = false, name = "end_time") String endTime,
            @RequestParam(required = false, name = "capacity") Integer numberOfGuest) {
        if (date != null && startTime != null && endTime != null && numberOfGuest != null) {
            return ResponseEntity.ok(service.searchAvailableRoom(date, startTime, endTime, numberOfGuest));
        } else if (date != null || startTime != null || endTime != null || numberOfGuest != null) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Missing search parameter");
        } else {
            return ResponseEntity.ok(service.getAllRoom());
        }
    }

    @GetMapping("/{id}")
    public ResponseEntity<RoomResponse> getRoomById(@PathVariable("id") Long roomId) {
        return ResponseEntity.ok(service.getRoomById(roomId));
    }

    @PostMapping()
    public ResponseEntity<RoomResponse> createRoom(@RequestBody CreateRoomRequest req) {
        return ResponseEntity.status(HttpStatus.CREATED).body(service.createRoom(req));
    }

    @PostMapping("/{id}/book")
    public Long bookRoom(@PathVariable("id") Long roomId, @RequestBody BookingRequest req,
            @RequestHeader("user_id") Long userId) {
        return service.bookRoom(roomId, userId, req);
    }

    @DeleteMapping("/{id}")
    public ResponseEntity<Void> deleteRoom(@PathVariable("id") Long roomId) {
        service.deleteRoom(roomId);
        return ResponseEntity.accepted().build();
    }
}