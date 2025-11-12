// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'todo.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TodoModelImpl _$$TodoModelImplFromJson(Map<String, dynamic> json) =>
    _$TodoModelImpl(
      id: (json['id'] as num?)?.toInt(),
      imageUrl: json['imageUrl'] as String? ?? '',
      content: json['content'] as String,
      dateTime: DateTime.parse(json['dateTime'] as String),
      isDone: (json['isDone'] as num?)?.toInt() ?? 0,
    );

Map<String, dynamic> _$$TodoModelImplToJson(_$TodoModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'imageUrl': instance.imageUrl,
      'content': instance.content,
      'dateTime': instance.dateTime.toIso8601String(),
      'isDone': instance.isDone,
    };
