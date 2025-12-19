sealed class MonthEvent {}

class OnClickPreviousMonth extends MonthEvent {}

class OnClickNextMonth extends MonthEvent {}

class OnSelectedDate extends MonthEvent {
  final DateTime selectedDate;

  OnSelectedDate(this.selectedDate);
}
