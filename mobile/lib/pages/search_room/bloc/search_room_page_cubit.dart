import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/pages/search_room/bloc/search_room_page_state.dart';

class SerachRoomPageCubit extends Cubit<SearchRoomPageState> {
  SerachRoomPageCubit() : super(const SearchRoomPageState());

  // final Dio _dio = Dio();
  // final DateFormat dateFormat = DateFormat('dd/MM/yyyy');
  // final DateFormat timeFormat = DateFormat('H:mm');

  // Future<void> getAvailableRoomList() async {
  //   try {
  //     final Response response = await _dio.get(
  //       'http://localhost:9002/booking-svc/api/v1/room',
  //       queryParameters: {
  //         'date': dateFormat.format(state.selectedDate!),
  //         'start_time': convertToHHmm(state.selectedStartTime!),
  //         'end_time': convertToHHmm(state.selectedEndTime!),
  //         'capacity': state.selectedCapacity,
  //       },
  //     );

  //     if (response.statusCode == 200) {
  //       _roomList.clear();

  //       List roomListResp = response.data!;
  //       for (var data in roomListResp) {
  //         Room room = Room.fromJson(data);
  //         _roomList.add(room);
  //       }
  //     }
  //     notifyListeners();
  //   } catch (e) {
  //     if (kDebugMode) {
  //       print(e);
  //     }
  //     rethrow;
  //   }
  // }

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
