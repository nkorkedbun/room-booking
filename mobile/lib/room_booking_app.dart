import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:meeting_room_booking/controller/booking_summary_page_controller.dart';
import 'package:meeting_room_booking/controller/room_selection_page_controller.dart';
import 'package:meeting_room_booking/controller/search_room_page_controller.dart';
import 'package:meeting_room_booking/main/main_app.dart';
import 'package:meeting_room_booking/main/main_injector.dart';
import 'package:meeting_room_booking/main/main_localization.dart';
import 'package:meeting_room_booking/main/main_system.dart';
import 'package:meeting_room_booking/pages/booking_summary/bloc/booking_summary_page_cubit.dart';
import 'package:meeting_room_booking/pages/landing_page/landing_page.dart';
import 'package:meeting_room_booking/pages/room_selection/bloc/room_selection_page_cubit.dart';
import 'package:meeting_room_booking/pages/search_room/bloc/search_room_page_cubit.dart';
import 'package:provider/provider.dart';
import 'package:root_dependencies/root_dependencies.dart';

class RoomBookingApp extends StatelessWidget {
  const RoomBookingApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<SerachRoomPageCubit>(
          create: (context) => SerachRoomPageCubit(),
        ),
        BlocProvider<RoomSelectionPageCubit>(
          create: (context) => RoomSelectionPageCubit(),
        ),
        BlocProvider<BookingSummaryPageCubit>(
          create: (context) => BookingSummaryPageCubit(),
        ),
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

// class RoomBookingApp extends RootApp {
//   RoomBookingApp({
//     Key? key,
//     Map<String, dynamic> args = const {},
//   }) : super(
//           key: key,
//           view: () => const MainApp(),
//           loadingView: () => const MaterialApp(
//             home: Scaffold(),
//           ),
//           system: () => MainSystem(),
//           blocInjector: MainInjector(),
//           localization: MainLocalization(),
//           args: () => args,
//         );
// }
