import 'package:flutter/material.dart';
import 'package:meeting_room_booking/common/room_card.dart';
import 'package:meeting_room_booking/controller/room_selection_page_controller.dart';
import 'package:meeting_room_booking/page/booking_summary_page.dart';
import 'package:provider/provider.dart';

import '../common/booking_room_app_bar.dart';

class RoomSelectionPage extends StatefulWidget {
  const RoomSelectionPage({super.key});
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
            Column(
              children: [
                Row(
                  children: const [
                    Text('Date'),
                    Spacer(),
                    Text('Time'),
                    SizedBox(
                      width: 175,
                    ),
                  ],
                ),
                Row(
                  children: [
                    Container(
                      width: 130,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF5CC99B),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF5CC99B)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
                    const Spacer(),
                    Container(
                      width: 210,
                      height: 45,
                      decoration: ShapeDecoration(
                        color: const Color(0xFF5CC99B),
                        shape: RoundedRectangleBorder(
                          side: const BorderSide(
                              width: 1, color: Color(0xFF5CC99B)),
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
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
                  ],
                )
              ],
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
                    onTap: () {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (_) => const BookingSummaryPage(),
                          settings: RouteSettings(
                            name: 'booking_summary_page',
                            arguments: {
                              "bookingSummary": context
                                  .read<RoomSelectionPageController>()
                                  .getBookingSummary(index),
                            },
                          ),
                        ),
                      );
                    },
                    child: RoomCard(
                      name: context
                              .read<RoomSelectionPageController>()
                              .rooms?[index]
                              .name ??
                          "-",
                      capacity: context
                              .read<RoomSelectionPageController>()
                              .rooms?[index]
                              .capacity ??
                          0,
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
