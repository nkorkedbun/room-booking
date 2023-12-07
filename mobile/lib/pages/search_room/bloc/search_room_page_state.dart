import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class SearchRoomPageState extends Equatable {
  final DateTime? selectedDate;
  final TimeOfDay? selectedStartTime;
  final TimeOfDay? selectedEndTime;
  final int? selectedCapacity;
  final List<Room>? roomList;

  const SearchRoomPageState({
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.selectedCapacity,
    this.roomList,
  });

  SearchRoomPageState copyWith({
    DateTime? selectedDate,
    TimeOfDay? selectedStartTime,
    TimeOfDay? selectedEndTime,
    int? selectedCapacity,
    List<Room>? roomList,
  }) {
    return SearchRoomPageState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
      selectedCapacity: selectedCapacity ?? this.selectedCapacity,
      roomList: roomList ?? this.roomList,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        selectedStartTime,
        selectedEndTime,
        selectedCapacity,
        roomList,
      ];
}