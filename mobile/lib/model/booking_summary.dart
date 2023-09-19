import 'package:flutter/material.dart';

class BookingSummary {
  int? id;
  DateTime? selectedDate;
  TimeOfDay? selectedStartTime;
  TimeOfDay? selectedEndTime;

  BookingSummary({
    this.id,
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
  });
}
