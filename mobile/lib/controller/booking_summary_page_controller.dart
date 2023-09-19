import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/model/booking_summary.dart';
import 'package:meeting_room_booking/model/room.dart';

class BookingSummaryPageController with ChangeNotifier {
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  final Dio dio = Dio();

  DateTime? _selectedDate;
  DateTime? get selectedDate => _selectedDate;

  TimeOfDay? _selectedStartTime;
  TimeOfDay? get selectedStartTime => _selectedStartTime;

  TimeOfDay? _selectedEndTime;
  TimeOfDay? get selectedEndTime => _selectedEndTime;

  Room? _roomDetail;
  Room? get roomDetail => _roomDetail;

  void initData(BookingSummary roomSelection) {
    _selectedDate = roomSelection.selectedDate;
    _selectedStartTime = roomSelection.selectedStartTime;
    _selectedEndTime = roomSelection.selectedEndTime;
    getRoomDetail(roomSelection.id!).then((resp) => _roomDetail = resp);
    notifyListeners();
  }

  Future<Room?> getRoomDetail(int id) async {
    try {
      Response response =
          await dio.get('http://localhost:9002/booking-svc/api/v1/room/$id');

      if (response.statusCode == 200) {
        _roomDetail = Room.fromJson(response.data);
      }
      notifyListeners();
      return roomDetail;
    } catch (e) {
      rethrow;
    }
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
