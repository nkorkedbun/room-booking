import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/model/room_selection.dart';
import 'package:meeting_room_booking/pages/search_room/bloc/search_room_page_state.dart';

class SerachRoomPageCubit extends Cubit<SearchRoomPageState> {
  SerachRoomPageCubit() : super(const SearchRoomPageState());

  final Dio _dio = Dio();
  final DateFormat dateFormat = DateFormat('dd/MM/yyyy');

  Future<void> getAvailableRoomList() async {
    try {
      final Response response = await _dio.get(
        'http://localhost:9002/booking-svc/api/v1/room',
        queryParameters: {
          'date': dateFormat.format(state.selectedDate!),
          'start_time': convertToHHmm(state.selectedStartTime!),
          'end_time': convertToHHmm(state.selectedEndTime!),
          'capacity': state.selectedCapacity,
        },
      );

      List<Room> roomList = [];
      if (response.statusCode == 200) {
        List roomListResp = response.data!;
        for (var data in roomListResp) {
          Room room = Room.fromJson(data);
          roomList.add(room);
        }
      }
      emit(state.copyWith(
        roomList: roomList,
        // status: SearchRoomStatus.init,
      ));
    } catch (e) {
      if (kDebugMode) {
        print(e);
      }
      // emit(state.copyWith(
      //   status: SearchRoomStatus.fail,
      //   code: e.response?.statusCode,
      //   message: e.response?.statusMessage,
      // ));
      rethrow;
    }
  }

  RoomSelection createRoomSelection() {
    return RoomSelection(
      selectedDate: state.selectedDate,
      selectedStartTime: state.selectedStartTime,
      selectedEndTime: state.selectedEndTime,
      selectedCapacity: state.selectedCapacity,
      rooms: state.roomList,
    );
  }

  void setSelectedDate(DateTime selectedDate) {
    emit(state.copyWith(
      selectedDate: selectedDate,
    ));
  }

  void setSelectedStartTime(TimeOfDay selectedStartTime) {
    emit(state.copyWith(
      selectedStartTime: selectedStartTime,
    ));
  }

  void setSelectedEndTime(TimeOfDay selectedEndTime) {
    emit(state.copyWith(
      selectedEndTime: selectedEndTime,
    ));
  }

  void setSelectedCapacity(int selectedCapacity) {
    emit(state.copyWith(
      selectedCapacity: selectedCapacity,
    ));
  }

  String convertToHHmm(TimeOfDay timeToConvert) {
    return "${timeToConvert.hour.toString().padLeft(2, '0')}:${timeToConvert.minute.toString().padLeft(2, '0')}";
  }
}
