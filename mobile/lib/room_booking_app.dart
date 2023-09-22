import 'package:flutter/material.dart';
import 'package:meeting_room_booking/controller/booking_summary_page_controller.dart';
import 'package:meeting_room_booking/controller/room_selection_page_controller.dart';
import 'package:meeting_room_booking/controller/search_room_page_controller.dart';
import 'package:meeting_room_booking/page/landing_page.dart';
import 'package:provider/provider.dart';

class RoomBookingApp extends StatelessWidget {
  const RoomBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchRoomPageController()),
        ChangeNotifierProvider(create: (_) => RoomSelectionPageController()),
        ChangeNotifierProvider(create: (_) => BookingSummaryPageController()),
      ],
      child: MaterialApp(
        title: 'Palo IT Meeting Room Booking App',
        theme: ThemeData(
          useMaterial3: true,
          colorSchemeSeed: const Color(0xFF5CC99B),
        ),
        home: const LandingPage(),
      ),
    );
  }
}
