import 'package:dio/dio.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/model/booking_summary.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/model/room_selection.dart';
import 'package:meeting_room_booking/pages/room_selection/bloc/room_selection_page_state.dart';

class RoomSelectionPageCubit extends Cubit<RoomSelectionPageState> {
  RoomSelectionPageCubit() : super(const RoomSelectionPageState());

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  final Dio _dio = Dio();

  BookingSummary getBookingSummary() {
    return BookingSummary(
      selectedDate: state.selectedDate,
      selectedStartTime: state.selectedStartTime,
      selectedEndTime: state.selectedEndTime,
      roomDetail: state.roomDetail,
    );
  }

  void initData(RoomSelection roomSelection) {
    emit(
      state.copyWith(
        selectedDate: roomSelection.selectedDate,
        selectedStartTime: roomSelection.selectedStartTime,
        selectedEndTime: roomSelection.selectedEndTime,
        selectedCapacity: roomSelection.selectedCapacity,
        roomList: roomSelection.rooms,
      ),
    );
  }

  Future<void> getRoomDetail(int id) async {
    try {
      Response response =
          await _dio.get('http://localhost:9002/booking-svc/api/v1/room/$id');

      if (response.statusCode == 200) {
        Room roomDetail = Room.fromJson(response.data);

        emit(state.copyWith(roomDetail: roomDetail));
      }
    } catch (e) {
      rethrow;
    }
  }

  String getFormattedDate() {
    return _dateFormat.format(state.selectedDate ?? DateTime.now());
  }

  String getFormattedStartTime() {
    return "${state.selectedStartTime?.hour.toString().padLeft(2, '0')}:${state.selectedStartTime?.minute.toString().padLeft(2, '0')}";
  }

  String getFormattedEndTime() {
    return "${state.selectedEndTime?.hour.toString().padLeft(2, '0')}:${state.selectedEndTime?.minute.toString().padLeft(2, '0')}";
  }
}
