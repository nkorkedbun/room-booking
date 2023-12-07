package com.paloit.meeting_room_booking.model.request;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import lombok.Data;

@Data
public class BookingRequest {
    private final DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    private final DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm");

    private String date;
    private String startTime;
    private String endTime;

    public LocalDateTime getStartDateTime() {
        return LocalDateTime.of(LocalDate.parse(date, DATE_FORMATTER), LocalTime.parse(startTime, TIME_FORMATTER));
    }

    public LocalDateTime getEndDateTime() {
        return LocalDateTime.of(LocalDate.parse(date, DATE_FORMATTER), LocalTime.parse(endTime, TIME_FORMATTER));
    }
}
