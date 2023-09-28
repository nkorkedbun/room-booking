import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/common/room_card.dart';
import 'package:meeting_room_booking/model/room.dart';
import 'package:meeting_room_booking/pages/booking_summary/bloc/booking_summary_page_cubit.dart';
import 'package:meeting_room_booking/pages/booking_summary/bloc/booking_summary_page_state.dart';

class BookingSummaryPage extends StatefulWidget {
  const BookingSummaryPage({super.key});

  @override
  State<BookingSummaryPage> createState() => _BookingSummaryPageState();
}

class _BookingSummaryPageState extends State<BookingSummaryPage> {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      Map<String, dynamic>? data =
          ModalRoute.of(context)?.settings.arguments as Map<String, dynamic>?;
      context.read<BookingSummaryPageCubit>().initData(data?['bookingSummary']);
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
          Positioned(
            bottom: 0,
            left: 0,
            right: 0,
            // child: SummaryDetailContainer(),
            child: Container(
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
                              child: BlocSelector<BookingSummaryPageCubit,
                                  BookingSummaryPageState, DateTime?>(
                                selector: (state) => state.selectedDate,
                                builder: (context, selectedDate) => Text(
                                  context
                                      .read<BookingSummaryPageCubit>()
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
                                '${context.watch<BookingSummaryPageCubit>().getFormattedStartTime()} - ${context.watch<BookingSummaryPageCubit>().getFormattedEndTime()}',
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
                  BlocSelector<BookingSummaryPageCubit, BookingSummaryPageState,
                      Room?>(
                    selector: (state) => state.roomDetail,
                    builder: (context, roomDetail) => RoomCard(
                      name: roomDetail?.name ?? '',
                      capacity: roomDetail?.capacity ?? 0,
                    ),
                  ),
                  const Spacer(),
                  ButtonBar(
                    alignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: MediaQuery.of(context).size.width,
                        height: 75,
                        child: OutlinedButton(
                          onPressed: () {
                            Navigator.pop(context);
                          },
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
            ),
          ),
        ],
      ),
    );
  }
}
