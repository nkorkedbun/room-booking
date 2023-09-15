import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class RoomSelection {
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  int? capacity;
  List<Room>? rooms;

  RoomSelection({
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.capacity,
    this.rooms,
  });
}
