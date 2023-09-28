import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class BookingSummaryPageState extends Equatable {
  final DateTime? selectedDate;
  final TimeOfDay? selectedStartTime;
  final TimeOfDay? selectedEndTime;
  final Room? roomDetail;

  const BookingSummaryPageState({
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.roomDetail,
  });

  BookingSummaryPageState copyWith({
    DateTime? selectedDate,
    TimeOfDay? selectedStartTime,
    TimeOfDay? selectedEndTime,
    Room? roomDetail,
  }) {
    return BookingSummaryPageState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
      roomDetail: roomDetail ?? this.roomDetail,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        selectedStartTime,
        selectedEndTime,
        roomDetail,
      ];
}
