import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:meeting_room_booking/model/room.dart';

class RoomSelectionPageState extends Equatable {
  final DateTime? selectedDate;
  final TimeOfDay? selectedStartTime;
  final TimeOfDay? selectedEndTime;
  final int? selectedCapacity;
  final List<Room>? roomList;
  final Room? roomDetail;

  const RoomSelectionPageState({
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.selectedCapacity,
    this.roomList,
    this.roomDetail,
  });

  RoomSelectionPageState copyWith({
    DateTime? selectedDate,
    TimeOfDay? selectedStartTime,
    TimeOfDay? selectedEndTime,
    int? selectedCapacity,
    List<Room>? roomList,
    Room? roomDetail,
  }) {
    return RoomSelectionPageState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
      selectedCapacity: selectedCapacity ?? this.selectedCapacity,
      roomList: roomList ?? this.roomList,
      roomDetail: roomDetail ?? this.roomDetail,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        selectedStartTime,
        selectedEndTime,
        selectedCapacity,
        roomList,
        roomDetail,
      ];
}
