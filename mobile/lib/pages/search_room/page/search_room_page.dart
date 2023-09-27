import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/common/booking_room_app_bar.dart';
import 'package:meeting_room_booking/common/date_picker_form_field.dart';
import 'package:meeting_room_booking/common/time_picker_form_field.dart';
import 'package:meeting_room_booking/controller/search_room_page_controller.dart';
import 'package:meeting_room_booking/pages/room_selection/page/room_selection_page.dart';
import 'package:meeting_room_booking/pages/search_room/bloc/search_room_page_cubit.dart';
import 'package:meeting_room_booking/pages/search_room/bloc/search_room_page_state.dart';

class SearchRoomPage extends StatefulWidget {
  const SearchRoomPage({super.key});

  @override
  State<SearchRoomPage> createState() => _SearchRoomPageState();
}

class _SearchRoomPageState extends State<SearchRoomPage> {
  final TextEditingController _controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BookingRoomAppBar('Make My Booking'),
      body: Container(
        margin: const EdgeInsets.only(left: 20, right: 22),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: const [
                SizedBox(
                  height: 50,
                ),
                Icon(Icons.calendar_month_sharp),
                Text("My Bookings")
              ],
            ),
            const SizedBox(
              height: 29,
            ),
            Form(
              child: Column(
                children: [
                  const Text("Number Of Guests", textAlign: TextAlign.start),
                  BlocSelector<SerachRoomPageCubit, SearchRoomPageState, int?>(
                    selector: (state) => state.selectedCapacity,
                    builder: (ctx, capacity) => TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: const InputDecoration(
                        labelText: 'Enter a number',
                        border: OutlineInputBorder(),
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Date", textAlign: TextAlign.start),
                  BlocSelector<SerachRoomPageCubit, SearchRoomPageState,
                      DateTime?>(
                    selector: (state) => state.selectedDate,
                    builder: (ctx, selectedDate) => DatePickerFormField(
                      onDateSelected: (selectedDate) => ctx
                          .read<SerachRoomPageCubit>()
                          .setSelectedDate(selectedDate),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("Start Time", textAlign: TextAlign.start),
                  BlocSelector<SerachRoomPageCubit, SearchRoomPageState,
                      TimeOfDay?>(
                    selector: (state) => state.selectedStartTime,
                    builder: (ctx, selectedStartTime) => TimePickerFormField(
                      onTimeSelected: (selectedTime) => ctx
                          .read<SerachRoomPageCubit>()
                          .setSelectedStartTime(selectedTime),
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  const Text("End Time", textAlign: TextAlign.start),
                  BlocSelector<SerachRoomPageCubit, SearchRoomPageState,
                      TimeOfDay?>(
                    selector: (state) => state.selectedEndTime,
                    builder: (ctx, selectedEndTime) => TimePickerFormField(
                      onTimeSelected: (selectedTime) => ctx
                          .read<SerachRoomPageCubit>()
                          .setSelectedEndTime(selectedTime),
                    ),
                  ),
                ],
              ),
            ),
            const Spacer(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () {
                      // context.read<SearchRoomPageController>().setCapacity(
                      //     _controller.text.isNotEmpty
                      //         ? int.parse(_controller.text)
                      //         : 0);
                      // context
                      //     .read<SearchRoomPageController>()
                      //     .getAvailableRoomList()
                      //     .then((value) {
                      //   Navigator.of(context).push(
                      //     MaterialPageRoute(
                      //       builder: (_) => const RoomSelectionPage(),
                      //       settings: RouteSettings(
                      //         name: 'room_selection_page',
                      //         arguments: {
                      //           "data": context
                      //               .read<SearchRoomPageController>()
                      //               .createRoomSelection()
                      //         },
                      //       ),
                      //     ),
                      //   );
                      // });
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: const Color(0xFF5CC99B),
                    ),
                    child: const Text('Search'),
                  ),
                )
              ],
            ),
            const SizedBox(
              height: 20,
            ),
          ],
        ),
      ),
    );
  }
}
