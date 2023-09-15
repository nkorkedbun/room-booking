import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:meeting_room_booking/controller/room_selection_page_controller.dart';
import 'package:meeting_room_booking/model/room_selection.dart';
import 'package:provider/provider.dart';

import '../common/booking_room_app_bar.dart';

class RoomSelectionPage extends StatefulWidget {
  const RoomSelectionPage({super.key});
  // const RoomSelectionPage(this.selectedDate, this.startTime, this.endTime,
  //     {super.key});
  // final DateTime selectedDate;
  // final DateTime startTime;
  // final DateTime endTime;
  @override
  State<RoomSelectionPage> createState() => _RoomSelectionPageState();
}

class _RoomSelectionPageState extends State<RoomSelectionPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map<String, dynamic>? data =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      context.read<RoomSelectionPageController>().initData(data?['data']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const BookingRoomAppBar("Select Meeting Room"),
      backgroundColor: Colors.white,
      body: Padding(
        padding: const EdgeInsets.fromLTRB(22, 30, 22, 0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text('Date'),
            Container(
              color: const Color(0xFF5CC99B),
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Center(
                child: Text(
                  context
                      .watch<RoomSelectionPageController>()
                      .getFormattedDate(),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 15,
            ),
            const Text('Time'),
            Container(
              color: const Color(0xFF5CC99B),
              width: MediaQuery.of(context).size.width,
              height: 45,
              child: Center(
                child: Text(
                  '${context.watch<RoomSelectionPageController>().getFormattedStartTime()} - ${context.watch<RoomSelectionPageController>().getFormattedEndTime()}',
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 16,
                    fontFamily: 'Open Sans',
                    fontWeight: FontWeight.w400,
                    height: 1.5,
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            const Text('Available Room'),
            const SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(
                  height: 20,
                ),
                itemCount:
                    context.read<RoomSelectionPageController>().rooms?.length ??
                        0,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {},
                    child: Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                          color: Colors.white,
                          border: Border.all()),
                      width: MediaQuery.of(context).size.width,
                      height: 75,
                      padding: const EdgeInsets.symmetric(horizontal: 18),
                      child: Row(
                        children: [
                          Text(
                              'Room ${context.read<RoomSelectionPageController>().rooms?[index].name}'),
                          const Spacer(),
                          Text(
                              '${context.read<RoomSelectionPageController>().capacity} Guest Max')
                        ],
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
