import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easylogger/flutter_logger.dart';
import 'package:meeting_room_booking/room_booking_app.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  // await dotenv.load();
  final args = <String, dynamic>{};

  Logger.init(
    kDebugMode,
    isShowNavigation: false,
  );
  runApp(const RoomBookingApp());
}
