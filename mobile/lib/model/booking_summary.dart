import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class BookingSummary {
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;
  Room? roomDetail;

  BookingSummary({
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.roomDetail,
  });
}
