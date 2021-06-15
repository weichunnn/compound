import 'package:flutter_bloc/flutter_bloc.dart';

import 'notifications_state.dart';

class NotificationsCubit extends Cubit<NotificationsState> {
  NotificationsCubit() : super(NotificationsInitial()) {
    getNotifications();
  }

  Future<void> getNotifications() async {
    try {
      emit(NotificationsLoading());
      var notifications = await notice();
      List newUpdates = notifications.where((noti) => noti['newUpdate']).toList();
      List pastUpdates = notifications.where((noti) => !noti['newUpdate']).toList();
      emit(NotificationsLoaded(newUpdates: newUpdates, pastUpdates: pastUpdates));
    } catch (e) {
      emit(NotificationsError(error: e));
    }
  }

  Future<List> notice() async {
    print('getting your notifications');
    await Future.delayed(Duration(seconds: 1));
    return [
      {
        'text': 'Credit Installment is due in 3 days',
        'timeStamp': '30 minutes ago',
        'newUpdate': false,
      },
      {
        'text': 'Credit Installment is due in 3 days',
        'timeStamp': '10 minutes ago',
        'newUpdate': true,
      },
      {
        'text': 'Credit Installment is due in 3 days',
        'timeStamp': '30 minutes ago',
        'newUpdate': false,
      },
    ];
  }
}
