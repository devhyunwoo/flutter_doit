// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'image_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

ImageResponse _$ImageResponseFromJson(Map<String, dynamic> json) {
  return _ImageResponse.fromJson(json);
}

/// @nodoc
mixin _$ImageResponse {
  List<ImageItem> get items => throw _privateConstructorUsedError;

  /// Serializes this ImageResponse to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageResponseCopyWith<ImageResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageResponseCopyWith<$Res> {
  factory $ImageResponseCopyWith(
    ImageResponse value,
    $Res Function(ImageResponse) then,
  ) = _$ImageResponseCopyWithImpl<$Res, ImageResponse>;
  @useResult
  $Res call({List<ImageItem> items});
}

/// @nodoc
class _$ImageResponseCopyWithImpl<$Res, $Val extends ImageResponse>
    implements $ImageResponseCopyWith<$Res> {
  _$ImageResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _value.copyWith(
            items: null == items
                ? _value.items
                : items // ignore: cast_nullable_to_non_nullable
                      as List<ImageItem>,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImageResponseImplCopyWith<$Res>
    implements $ImageResponseCopyWith<$Res> {
  factory _$$ImageResponseImplCopyWith(
    _$ImageResponseImpl value,
    $Res Function(_$ImageResponseImpl) then,
  ) = __$$ImageResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<ImageItem> items});
}

/// @nodoc
class __$$ImageResponseImplCopyWithImpl<$Res>
    extends _$ImageResponseCopyWithImpl<$Res, _$ImageResponseImpl>
    implements _$$ImageResponseImplCopyWith<$Res> {
  __$$ImageResponseImplCopyWithImpl(
    _$ImageResponseImpl _value,
    $Res Function(_$ImageResponseImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? items = null}) {
    return _then(
      _$ImageResponseImpl(
        items: null == items
            ? _value._items
            : items // ignore: cast_nullable_to_non_nullable
                  as List<ImageItem>,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageResponseImpl implements _ImageResponse {
  const _$ImageResponseImpl({required final List<ImageItem> items})
    : _items = items;

  factory _$ImageResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageResponseImplFromJson(json);

  final List<ImageItem> _items;
  @override
  List<ImageItem> get items {
    if (_items is EqualUnmodifiableListView) return _items;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_items);
  }

  @override
  String toString() {
    return 'ImageResponse(items: $items)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageResponseImpl &&
            const DeepCollectionEquality().equals(other._items, _items));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_items));

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageResponseImplCopyWith<_$ImageResponseImpl> get copyWith =>
      __$$ImageResponseImplCopyWithImpl<_$ImageResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageResponseImplToJson(this);
  }
}

abstract class _ImageResponse implements ImageResponse {
  const factory _ImageResponse({required final List<ImageItem> items}) =
      _$ImageResponseImpl;

  factory _ImageResponse.fromJson(Map<String, dynamic> json) =
      _$ImageResponseImpl.fromJson;

  @override
  List<ImageItem> get items;

  /// Create a copy of ImageResponse
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageResponseImplCopyWith<_$ImageResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

ImageItem _$ImageItemFromJson(Map<String, dynamic> json) {
  return _ImageItem.fromJson(json);
}

/// @nodoc
mixin _$ImageItem {
  String get link => throw _privateConstructorUsedError;

  /// Serializes this ImageItem to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of ImageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $ImageItemCopyWith<ImageItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $ImageItemCopyWith<$Res> {
  factory $ImageItemCopyWith(ImageItem value, $Res Function(ImageItem) then) =
      _$ImageItemCopyWithImpl<$Res, ImageItem>;
  @useResult
  $Res call({String link});
}

/// @nodoc
class _$ImageItemCopyWithImpl<$Res, $Val extends ImageItem>
    implements $ImageItemCopyWith<$Res> {
  _$ImageItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of ImageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? link = null}) {
    return _then(
      _value.copyWith(
            link: null == link
                ? _value.link
                : link // ignore: cast_nullable_to_non_nullable
                      as String,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$ImageItemImplCopyWith<$Res>
    implements $ImageItemCopyWith<$Res> {
  factory _$$ImageItemImplCopyWith(
    _$ImageItemImpl value,
    $Res Function(_$ImageItemImpl) then,
  ) = __$$ImageItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String link});
}

/// @nodoc
class __$$ImageItemImplCopyWithImpl<$Res>
    extends _$ImageItemCopyWithImpl<$Res, _$ImageItemImpl>
    implements _$$ImageItemImplCopyWith<$Res> {
  __$$ImageItemImplCopyWithImpl(
    _$ImageItemImpl _value,
    $Res Function(_$ImageItemImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of ImageItem
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? link = null}) {
    return _then(
      _$ImageItemImpl(
        link: null == link
            ? _value.link
            : link // ignore: cast_nullable_to_non_nullable
                  as String,
      ),
    );
  }
}

/// @nodoc
@JsonSerializable()
class _$ImageItemImpl implements _ImageItem {
  const _$ImageItemImpl({required this.link});

  factory _$ImageItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$ImageItemImplFromJson(json);

  @override
  final String link;

  @override
  String toString() {
    return 'ImageItem(link: $link)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$ImageItemImpl &&
            (identical(other.link, link) || other.link == link));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, link);

  /// Create a copy of ImageItem
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$ImageItemImplCopyWith<_$ImageItemImpl> get copyWith =>
      __$$ImageItemImplCopyWithImpl<_$ImageItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$ImageItemImplToJson(this);
  }
}

abstract class _ImageItem implements ImageItem {
  const factory _ImageItem({required final String link}) = _$ImageItemImpl;

  factory _ImageItem.fromJson(Map<String, dynamic> json) =
      _$ImageItemImpl.fromJson;

  @override
  String get link;

  /// Create a copy of ImageItem
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$ImageItemImplCopyWith<_$ImageItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
