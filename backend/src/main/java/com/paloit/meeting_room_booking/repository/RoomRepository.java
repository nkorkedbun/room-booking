package com.paloit.meeting_room_booking.repository;

import java.time.LocalDateTime;
import java.util.List;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import com.paloit.meeting_room_booking.entity.Room;

public interface RoomRepository extends JpaRepository<Room, Long> {

    @Query(value = """
        SELECT r.id, r.name, r.max_capacity
        FROM room r
        WHERE r.id NOT IN (
            SELECT DISTINCT b.room_id
            FROM booking b
            WHERE (
                (b.start_time <= :endTime AND b.end_time >= :startDate)
                OR
                (b.start_time >= :startDate AND b.start_time <= :endTime)
                OR
                (b.end_time >= :startDate AND b.end_time <= :endTime)
            )
        )
        AND r.max_capacity >= :numberOfGuest
        """, nativeQuery = true)
    List<Room> findAvailableRoom(Integer numberOfGuest, LocalDateTime startDate, LocalDateTime endTime);
}
