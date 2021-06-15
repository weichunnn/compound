abstract class NotificationsState {
  const NotificationsState();
}

class NotificationsInitial extends NotificationsState {}

class NotificationsLoading extends NotificationsState {}

class NotificationsLoaded extends NotificationsState {
  final List newUpdates;
  final List pastUpdates;
  NotificationsLoaded({this.newUpdates, this.pastUpdates});
}

class NotificationsError extends NotificationsState {
  final String error;
  NotificationsError({this.error});
}
