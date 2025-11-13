import 'package:doit_app/ui/home/contract/state/todo.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState({
    @Default('') String query,
    required List<TodoModel> items,
  }) = _HomeState;
}
