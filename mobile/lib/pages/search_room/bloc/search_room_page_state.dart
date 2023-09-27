import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';

class SearchRoomPageState extends Equatable {
  final DateTime? selectedDate;
  final TimeOfDay? selectedStartTime;
  final TimeOfDay? selectedEndTime;
  final int? selectedCapacity;

  const SearchRoomPageState({
    this.selectedDate,
    this.selectedStartTime,
    this.selectedEndTime,
    this.selectedCapacity,
  });

  SearchRoomPageState copyWith({
    DateTime? selectedDate,
    TimeOfDay? selectedStartTime,
    TimeOfDay? selectedEndTime,
    int? selectedCapacity,
  }) {
    return SearchRoomPageState(
      selectedDate: selectedDate ?? this.selectedDate,
      selectedStartTime: selectedStartTime ?? this.selectedStartTime,
      selectedEndTime: selectedEndTime ?? this.selectedEndTime,
      selectedCapacity: selectedCapacity ?? this.selectedCapacity,
    );
  }

  @override
  List<Object?> get props => [
        selectedDate,
        selectedStartTime,
        selectedEndTime,
        selectedCapacity,
      ];
}
