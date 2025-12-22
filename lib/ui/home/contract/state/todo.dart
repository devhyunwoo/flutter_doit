import 'package:freezed_annotation/freezed_annotation.dart';

part 'todo.freezed.dart';
part 'todo.g.dart';

@freezed
class TodoModel with _$TodoModel {
  const factory TodoModel({
    int? id,
    @Default('') String imageUrl,
    required String content,
    required DateTime dateTime,
    @Default(0) int isDone,
    @Default(0) int isTBD,
  }) = _TodoModel;

  factory TodoModel.fromJson(Map<String, dynamic> json) => _$TodoModelFromJson(json);
}
