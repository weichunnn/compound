abstract class NotificationsState {
  const NotificationsState();
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final Map notifications;
  NotificationsLoaded({this.notifications});
}

class NotificationsError extends NotificationsState {
  final String error;
  NotificationsError({this.error});
}
