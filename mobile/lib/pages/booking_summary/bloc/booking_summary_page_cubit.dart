import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/model/booking_summary.dart';
import 'package:meeting_room_booking/pages/booking_summary/bloc/booking_summary_page_state.dart';

class BookingSummaryPageCubit extends Cubit<BookingSummaryPageState> {
  BookingSummaryPageCubit() : super(const BookingSummaryPageState());

  final DateFormat _dateFormat = DateFormat('dd/MM/yyyy');

  void initData(BookingSummary roomSelection) {
    emit(
      state.copyWith(
        selectedDate: roomSelection.selectedDate,
        selectedStartTime: roomSelection.selectedStartTime,
        selectedEndTime: roomSelection.selectedEndTime,
        roomDetail: roomSelection.roomDetail,
      ),
    );
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
