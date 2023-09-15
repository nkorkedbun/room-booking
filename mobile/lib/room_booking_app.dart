import 'package:flutter/material.dart';
import 'package:meeting_room_booking/controller/room_selection_page_controller.dart';
import 'package:meeting_room_booking/controller/search_room_page_controller.dart';
import 'package:meeting_room_booking/page/search_room_page.dart';
import 'package:provider/provider.dart';

class RoomBookingApp extends StatelessWidget {
  const RoomBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => SearchRoomPageController()),
        ChangeNotifierProvider(create: (_) => RoomSelectionPageController()),
      ],
      child: MaterialApp(
        title: 'Palo IT Meeting Room Booking App',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: const SearchRoomPage(),
        // home: const LandingPage(),
        // home: RoomSelectionPage(DateTime.now(), DateTime.now(), DateTime.now()),
      ),
    );
  }
}
