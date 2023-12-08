package com.paloit.meeting_room_booking.model.request;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.LocalTime;
import java.time.format.DateTimeFormatter;

import com.fasterxml.jackson.annotation.JsonIgnore;

import lombok.Data;

@Data
public class BookingRequest {

    public final static DateTimeFormatter DATE_FORMATTER = DateTimeFormatter.ofPattern("dd/MM/yyyy");
    public final static DateTimeFormatter TIME_FORMATTER = DateTimeFormatter.ofPattern("HH:mm");

    private String date;
    private String startTime;
    private String endTime;

    @JsonIgnore
    public LocalDateTime getStartDateTime() {
        return LocalDateTime.of(LocalDate.parse(date, DATE_FORMATTER), LocalTime.parse(startTime, TIME_FORMATTER));
    }

    @JsonIgnore
    public LocalDateTime getEndDateTime() {
        return LocalDateTime.of(LocalDate.parse(date, DATE_FORMATTER), LocalTime.parse(endTime, TIME_FORMATTER));
    }
}
