import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/model/room_selection.dart';

class SearchRoomPageController with ChangeNotifier {
  final Dio _dio = Dio();
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  final DateFormat timeFormat = DateFormat('H:mm');

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;
  TimeOfDay? _selectedStartTime;
  TimeOfDay? get selectedStartTime => _selectedStartTime;
  TimeOfDay? _selectedEndTime;
  TimeOfDay? get selectedEndTime => _selectedEndTime;
  int? _capacity;
  int? get capacity => _capacity;
  final List<Room> _roomList = [];
  List<Room> get roomList => _roomList;

  Future<void> getAvailableRoomList() async {
    try {
      final Response response = await _dio.get(
          'http://localhost:9002/booking-svc/api/v1/room',
          queryParameters: {
            'date': dateFormat.format(selectedDate!),
            'start_time': convertToHHmm(selectedStartTime!),
            'end_time': convertToHHmm(selectedEndTime!),
            'capacity': capacity
          });

      if (response.statusCode == 200) {
        _roomList.clear();

        List roomListResp = response.data!;
        for (var data in roomListResp) {
          Room room = Room.fromJson(data);
          _roomList.add(room);
        }
      }
      notifyListeners();
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      rethrow;
    }
  }

  void setSelectedDate(DateTime selectedDate) {
    _selectedDate = selectedDate;
    notifyListeners();
  }

  void setSelectedStartTime(TimeOfDay selectedStartTime) {
    _selectedStartTime = selectedStartTime;
    notifyListeners();
  }

  void setSelectedEndTime(TimeOfDay selectedEndTime) {
    _selectedEndTime = selectedEndTime;
    notifyListeners();
  }

  void setCapacity(int capacity) {
    _capacity = capacity;
    notifyListeners();
  }

  RoomSelection createRoomSelection() {
    return RoomSelection(
        selectedDate: _selectedDate,
        selectedStartTime: _selectedStartTime,
        selectedEndTime: _selectedEndTime,
        capacity: _capacity,
        rooms: _roomList);
  }

  String convertToHHmm(TimeOfDay timeToConvert) {
    return "${timeToConvert.hour.toString().padLeft(2, '0')}:${timeToConvert.minute.toString().padLeft(2, '0')}";
  }
}
