import 'package:freezed_annotation/freezed_annotation.dart';

part 'image_response.freezed.dart';
part 'image_response.g.dart';

@freezed
class ImageResponse with _$ImageResponse {
  const factory ImageResponse({required List<ImageItem> items}) = _ImageResponse;

  factory ImageResponse.fromJson(Map<String, dynamic> json) =>
      _$ImageResponseFromJson(json);
}

@freezed
class ImageItem with _$ImageItem {
  const factory ImageItem({required String link}) = _ImageItem;

  factory ImageItem.fromJson(Map<String, dynamic> json) =>
      _$ImageItemFromJson(json);
}
