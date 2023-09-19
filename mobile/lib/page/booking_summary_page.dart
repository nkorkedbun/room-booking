import 'package:flutter/material.dart';
import 'package:meeting_room_booking/common/room_card.dart';
import 'package:meeting_room_booking/controller/booking_summary_page_controller.dart';
import 'package:provider/provider.dart';

class BookingSummaryPage extends StatefulWidget {
  const BookingSummaryPage({super.key});

  @override
  State<BookingSummaryPage> createState() => _BookingSummaryPageState();
}

class _BookingSummaryPageState extends State<BookingSummaryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      Map<String, dynamic>? data =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      context
          .read<BookingSummaryPageController>()
          .initData(data?['bookingSummary']);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/booking_summary_bg.png'),
                fit: BoxFit.fitHeight,
                alignment: Alignment.bottomCenter,
              ),
            ),
          ),
          const Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            child: SummaryDetailContainer(),
          ),
        ],
      ),
    );
  }
}

class SummaryDetailContainer extends StatefulWidget {
  const SummaryDetailContainer({super.key});

  @override
  State<SummaryDetailContainer> createState() => _SummaryDetailContainerState();
}

class _SummaryDetailContainerState extends State<SummaryDetailContainer> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(22, 40, 22, 0),
      height: 474,
      decoration: const ShapeDecoration(
        color: Colors.white,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30),
            topRight: Radius.circular(30),
          ),
        ),
      ),
      child: Column(
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
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        context
                            .watch<BookingSummaryPageController>()
                            .getFormattedDate(),
                        style: const TextStyle(
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
                      shape: RoundedRectangleBorder(
                        side: const BorderSide(
                          width: 1,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    child: Center(
                      child: Text(
                        '${context.watch<BookingSummaryPageController>().getFormattedStartTime()} - ${context.watch<BookingSummaryPageController>().getFormattedEndTime()}',
                        style: const TextStyle(
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
            height: 20,
          ),
          const Text('Selected Room'),
          const SizedBox(
            height: 10,
          ),
          RoomCard(
            name: context
                    .watch<BookingSummaryPageController>()
                    .roomDetail
                    ?.name ??
                '-',
            capacity: context
                    .watch<BookingSummaryPageController>()
                    .roomDetail
                    ?.capacity ??
                0,
          ),
          const Spacer(),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: OutlinedButton(
                  onPressed: () {},
                  style: OutlinedButton.styleFrom(
                    side: const BorderSide(color: Color(0xFF5CC99B)),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Cancel',
                    style: TextStyle(color: Color(0xFF5CC99B)),
                  ),
                ),
              )
            ],
          ),
          ButtonBar(
            alignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: 75,
                child: ElevatedButton(
                  onPressed: () {},
                  style: ElevatedButton.styleFrom(
                    backgroundColor: const Color(0xFF5CC99B),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                  child: const Text(
                    'Confirm Booking',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
          const SizedBox(
            height: 40,
          )
        ],
      ),
    );
  }
}
