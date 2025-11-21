import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'month_state.freezed.dart';

@freezed
class MonthState with _$MonthState {
  const factory MonthState({
    required List<TodoModel> todos,
    required int selectedMonth,
  }) = _MonthState;
}