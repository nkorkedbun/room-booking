import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/model/room_selection.dart';

class RoomSelectionPageController with ChangeNotifier {
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  TimeOfDay? _selectedStartTime;
  TimeOfDay? get selectedStartTime => _selectedStartTime;

  TimeOfDay? _selectedEndTime;
  TimeOfDay? get selectedEndTime => _selectedEndTime;

  int? _capacity;
  int? get capacity => _capacity;

  List<Room>? _rooms;
  List<Room>? get rooms => _rooms;

  void initData(RoomSelection roomSelection) {
    _selectedDate = roomSelection.selectedDate;
    _selectedStartTime = roomSelection.selectedStartTime;
    _selectedEndTime = roomSelection.selectedEndTime;
    _capacity = roomSelection.capacity;
    _rooms = roomSelection.rooms;
    notifyListeners();
  }

  String getFormattedDate() {
    return dateFormat.format(_selectedDate ?? DateTime.now());
  }

  String getFormattedStartTime() {
    return "${_selectedStartTime?.hour.toString().padLeft(2, '0')}:${_selectedStartTime?.minute.toString().padLeft(2, '0')}";
  }

  String getFormattedEndTime() {
    return "${_selectedEndTime?.hour.toString().padLeft(2, '0')}:${_selectedEndTime?.minute.toString().padLeft(2, '0')}";
  }
}
