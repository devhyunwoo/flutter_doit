// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'month_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
  'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models',
);

/// @nodoc
mixin _$MonthState {
  List<TodoModel> get todos => throw _privateConstructorUsedError;
  int get selectedMonth => throw _privateConstructorUsedError;

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $MonthStateCopyWith<MonthState> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MonthStateCopyWith<$Res> {
  factory $MonthStateCopyWith(
    MonthState value,
    $Res Function(MonthState) then,
  ) = _$MonthStateCopyWithImpl<$Res, MonthState>;
  @useResult
  $Res call({List<TodoModel> todos, int selectedMonth});
}

/// @nodoc
class _$MonthStateCopyWithImpl<$Res, $Val extends MonthState>
    implements $MonthStateCopyWith<$Res> {
  _$MonthStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todos = null, Object? selectedMonth = null}) {
    return _then(
      _value.copyWith(
            todos: null == todos
                ? _value.todos
                : todos // ignore: cast_nullable_to_non_nullable
                      as List<TodoModel>,
            selectedMonth: null == selectedMonth
                ? _value.selectedMonth
                : selectedMonth // ignore: cast_nullable_to_non_nullable
                      as int,
          )
          as $Val,
    );
  }
}

/// @nodoc
abstract class _$$MonthStateImplCopyWith<$Res>
    implements $MonthStateCopyWith<$Res> {
  factory _$$MonthStateImplCopyWith(
    _$MonthStateImpl value,
    $Res Function(_$MonthStateImpl) then,
  ) = __$$MonthStateImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<TodoModel> todos, int selectedMonth});
}

/// @nodoc
class __$$MonthStateImplCopyWithImpl<$Res>
    extends _$MonthStateCopyWithImpl<$Res, _$MonthStateImpl>
    implements _$$MonthStateImplCopyWith<$Res> {
  __$$MonthStateImplCopyWithImpl(
    _$MonthStateImpl _value,
    $Res Function(_$MonthStateImpl) _then,
  ) : super(_value, _then);

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({Object? todos = null, Object? selectedMonth = null}) {
    return _then(
      _$MonthStateImpl(
        todos: null == todos
            ? _value._todos
            : todos // ignore: cast_nullable_to_non_nullable
                  as List<TodoModel>,
        selectedMonth: null == selectedMonth
            ? _value.selectedMonth
            : selectedMonth // ignore: cast_nullable_to_non_nullable
                  as int,
      ),
    );
  }
}

/// @nodoc

class _$MonthStateImpl implements _MonthState {
  const _$MonthStateImpl({
    required final List<TodoModel> todos,
    required this.selectedMonth,
  }) : _todos = todos;

  final List<TodoModel> _todos;
  @override
  List<TodoModel> get todos {
    if (_todos is EqualUnmodifiableListView) return _todos;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_todos);
  }

  @override
  final int selectedMonth;

  @override
  String toString() {
    return 'MonthState(todos: $todos, selectedMonth: $selectedMonth)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MonthStateImpl &&
            const DeepCollectionEquality().equals(other._todos, _todos) &&
            (identical(other.selectedMonth, selectedMonth) ||
                other.selectedMonth == selectedMonth));
  }

  @override
  int get hashCode => Object.hash(
    runtimeType,
    const DeepCollectionEquality().hash(_todos),
    selectedMonth,
  );

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$MonthStateImplCopyWith<_$MonthStateImpl> get copyWith =>
      __$$MonthStateImplCopyWithImpl<_$MonthStateImpl>(this, _$identity);
}

abstract class _MonthState implements MonthState {
  const factory _MonthState({
    required final List<TodoModel> todos,
    required final int selectedMonth,
  }) = _$MonthStateImpl;

  @override
  List<TodoModel> get todos;
  @override
  int get selectedMonth;

  /// Create a copy of MonthState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$MonthStateImplCopyWith<_$MonthStateImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
