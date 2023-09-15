package com.paloit.meeting_room_booking.service;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;
import java.util.List;
import java.util.Optional;

import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Service;
import org.springframework.web.server.ResponseStatusException;

import com.paloit.meeting_room_booking.entity.Booking;
import com.paloit.meeting_room_booking.entity.Room;
import com.paloit.meeting_room_booking.model.request.BookingRequest;
import com.paloit.meeting_room_booking.model.request.CreateRoomRequest;
import com.paloit.meeting_room_booking.model.response.RoomResponse;
import com.paloit.meeting_room_booking.repository.BookingRepository;
import com.paloit.meeting_room_booking.repository.RoomRepository;
import com.paloit.meeting_room_booking.repository.UserRepository;

import lombok.RequiredArgsConstructor;

@RequiredArgsConstructor
@Service
public class RoomService {

    private final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    private final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm");

    private final RoomRepository roomRepo;
    private final BookingRepository bookingRepo;
    private final UserRepository userRepo;

    public List<RoomResponse> getAllRoom() {
        List<Room> allRoom = roomRepo.findAll();
        if (allRoom.isEmpty()) {
            throw new ResponseStatusException(HttpStatus.NOT_FOUND);
        }
        return allRoom.stream().map(RoomResponse::new).toList();
    }

    public RoomResponse getRoomById(Long roomId) {
        Optional<Room> room = roomRepo.findById(roomId);
        roomRepo.getReferenceById(roomId);
        return room.map(RoomResponse::new).orElseThrow(() -> new ResponseStatusException(HttpStatus.NOT_FOUND));
    }

    public RoomResponse createRoom(CreateRoomRequest req) {
        Room newRoom = Room.builder().maxCapacity(req.getMaxCapacity()).name(req.getRoomName()).build();
        newRoom = roomRepo.save(newRoom);
        return new RoomResponse(newRoom);
    }

    public List<RoomResponse> searchAvailableRoom(String date, String startTime, String endTime,
            Integer numberOfGuest) {
        LocalDate convertedDate = LocalDate.parse(date, DATE_FORMATTER);
        LocalTime convertedStartTime = LocalTime.parse(startTime, TIME_FORMATTER);
        LocalTime convertedEndTime = LocalTime.parse(endTime, TIME_FORMATTER);
        return roomRepo
                .findAvailableRoom(numberOfGuest, LocalDateTime.of(convertedDate, convertedStartTime),
                        LocalDateTime.of(convertedDate, convertedEndTime))
                .stream().map(RoomResponse::new).toList();
    }

    public void deleteRoom(Long roomId) {
        roomRepo.deleteById(roomId);
    }

    public void bookRoom(Long roomId, Long userId, BookingRequest req) {
        if (validateBookingTime(req.getStartTime(), req.getEndTime())) {
            throw new ResponseStatusException(HttpStatus.BAD_REQUEST, "Invalid Booking Time");
        }
        Booking booking = new Booking();
        booking.setStartTime(req.getStartTime());
        booking.setEndTime(req.getEndTime());
        booking.setRoom(roomRepo.findById(roomId).get());
        booking.setUser(userRepo.findById(userId).get());
        bookingRepo.save(booking);
    }

    private boolean validateBookingTime(LocalDateTime startTime, LocalDateTime endTime) {
        return startTime.isBefore(endTime) && isWithin30MinuteTimeFrame(startTime)
                && isWithin30MinuteTimeFrame(endTime);
    }

    private boolean isWithin30MinuteTimeFrame(LocalDateTime time) {
        return (time.getMinute() % 30) == 0;
    }
}
