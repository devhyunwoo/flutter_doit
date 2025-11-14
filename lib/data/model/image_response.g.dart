// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'image_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ImageResponseImpl _$$ImageResponseImplFromJson(Map<String, dynamic> json) =>
    _$ImageResponseImpl(
      items: (json['items'] as List<dynamic>)
          .map((e) => ImageItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$ImageResponseImplToJson(_$ImageResponseImpl instance) =>
    <String, dynamic>{'items': instance.items};

_$ImageItemImpl _$$ImageItemImplFromJson(Map<String, dynamic> json) =>
    _$ImageItemImpl(link: json['link'] as String);

Map<String, dynamic> _$$ImageItemImplToJson(_$ImageItemImpl instance) =>
    <String, dynamic>{'link': instance.link};
