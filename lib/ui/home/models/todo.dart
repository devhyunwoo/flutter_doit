import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    required int id,
    required String title,
    required String content,
    required DateTime dateTime,
    @Default(false) bool isDone,
  }) = _TodoModel;
}

