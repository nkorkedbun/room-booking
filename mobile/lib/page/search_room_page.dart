import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/common/booking_room_app_bar.dart';
import 'package:meeting_room_booking/common/date_picker_form_field.dart';
import 'package:meeting_room_booking/common/time_picker_form_field.dart';
import 'package:meeting_room_booking/controller/search_room_page_controller.dart';
import 'package:meeting_room_booking/page/room_selection_page.dart';
import 'package:provider/provider.dart';

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
            const Text("Number Of Guests", textAlign: TextAlign.start),
            TextField(
              controller: _controller,
              keyboardType: TextInputType.number,
              decoration: const InputDecoration(
                labelText: 'Enter a number',
                border: OutlineInputBorder(),
              ),
            ),
            const SizedBox(
              height: 20,
            ),
            const Text("Date", textAlign: TextAlign.start),
            DatePickerFormField(
                onDateSelected: (selectedDate) => context
                    .read<SearchRoomPageController>()
                    .setSelectedDate(selectedDate)),
            const SizedBox(
              height: 20,
            ),
            const Text("Start Time", textAlign: TextAlign.start),
            TimePickerFormField(onTimeSelected: (selectedTime) {
              context
                  .read<SearchRoomPageController>()
                  .setSelectedStartTime(selectedTime);
            }),
            const SizedBox(
              height: 20,
            ),
            const Text("End Time", textAlign: TextAlign.start),
            TimePickerFormField(onTimeSelected: (selectedTime) {
              context
                  .read<SearchRoomPageController>()
                  .setSelectedEndTime(selectedTime);
            }),
            const Spacer(),
            ButtonBar(
              alignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  width: MediaQuery.of(context).size.width,
                  height: 75,
                  child: ElevatedButton(
                    onPressed: () {
                      context.read<SearchRoomPageController>().setCapacity(
                          _controller.text.isNotEmpty
                              ? int.parse(_controller.text)
                              : 0);
                      context
                          .read<SearchRoomPageController>()
                          .getAvailableRoomList()
                          .then((value) {
                        Navigator.of(context).push(
                          MaterialPageRoute(
                            builder: (_) => const RoomSelectionPage(),
                            settings: RouteSettings(
                              name: 'room_selection_page',
                              arguments: {
                                "data": context
                                    .read<SearchRoomPageController>()
                                    .createRoomSelection()
                              },
                            ),
                          ),
                        );
                      });
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
