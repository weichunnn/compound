import 'package:flutter_bloc/flutter_bloc.dart';

import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial()) {
    getNotifications();
  }

  Future<void> getNotifications() async {
    try {
      emit(NotificationsLoading());
      final notifications = {};
      emit(NotificationsLoaded(notifications: notifications));
    } catch (e) {
      emit(NotificationsError(error: e));
    }
  }
}
