import 'package:meeting_room_booking/common/bloc/application_cubit.dart';
import 'package:meeting_room_booking/pages/booking_summary/bloc/booking_summary_page_cubit.dart';
import 'package:meeting_room_booking/pages/room_selection/bloc/room_selection_page_cubit.dart';
import 'package:meeting_room_booking/pages/search_room/bloc/search_room_page_cubit.dart';
import 'package:root_dependencies/root_dependencies.dart';

class MainInjector extends BlocInjector {
  @override
  injectBlocs(InjectBloc inject) {
    inject(ApplicationCubit());
    inject(SerachRoomPageCubit(), lazy: true);
    inject(RoomSelectionPageCubit(), lazy: true);
    inject(BookingSummaryPageCubit(), lazy: true);
  }
}

class ApplicationMixin {
  final application = SystemDependencies.of<ApplicationCubit>();
}
