abstract class DashboardEvent {}

class OverviewTimeSelected extends DashboardEvent {
  final String selectedText;
  OverviewTimeSelected({this.selectedText});
}

class OverviewTypeSelected extends DashboardEvent {
  final String selectedText;
  OverviewTypeSelected({this.selectedText});
}
