// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'statistics_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

StatisticsModel _$StatisticsModelFromJson(Map<String, dynamic> json) {
  return _StatisticsModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticsModel {
  List<StatisticModel>? get statistics => throw _privateConstructorUsedError;
  set statistics(List<StatisticModel>? value) =>
      throw _privateConstructorUsedError;

  /// Serializes this StatisticsModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticsModelCopyWith<StatisticsModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticsModelCopyWith<$Res> {
  factory $StatisticsModelCopyWith(
          StatisticsModel value, $Res Function(StatisticsModel) then) =
      _$StatisticsModelCopyWithImpl<$Res, StatisticsModel>;
  @useResult
  $Res call({List<StatisticModel>? statistics});
}

/// @nodoc
class _$StatisticsModelCopyWithImpl<$Res, $Val extends StatisticsModel>
    implements $StatisticsModelCopyWith<$Res> {
  _$StatisticsModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = freezed,
  }) {
    return _then(_value.copyWith(
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<StatisticModel>?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticsModelImplCopyWith<$Res>
    implements $StatisticsModelCopyWith<$Res> {
  factory _$$StatisticsModelImplCopyWith(_$StatisticsModelImpl value,
          $Res Function(_$StatisticsModelImpl) then) =
      __$$StatisticsModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<StatisticModel>? statistics});
}

/// @nodoc
class __$$StatisticsModelImplCopyWithImpl<$Res>
    extends _$StatisticsModelCopyWithImpl<$Res, _$StatisticsModelImpl>
    implements _$$StatisticsModelImplCopyWith<$Res> {
  __$$StatisticsModelImplCopyWithImpl(
      _$StatisticsModelImpl _value, $Res Function(_$StatisticsModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? statistics = freezed,
  }) {
    return _then(_$StatisticsModelImpl(
      statistics: freezed == statistics
          ? _value.statistics
          : statistics // ignore: cast_nullable_to_non_nullable
              as List<StatisticModel>?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticsModelImpl implements _StatisticsModel {
  _$StatisticsModelImpl({this.statistics});

  factory _$StatisticsModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticsModelImplFromJson(json);

  @override
  List<StatisticModel>? statistics;

  @override
  String toString() {
    return 'StatisticsModel(statistics: $statistics)';
  }

  /// Create a copy of StatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      __$$StatisticsModelImplCopyWithImpl<_$StatisticsModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticsModelImplToJson(
      this,
    );
  }
}

abstract class _StatisticsModel implements StatisticsModel {
  factory _StatisticsModel({List<StatisticModel>? statistics}) =
      _$StatisticsModelImpl;

  factory _StatisticsModel.fromJson(Map<String, dynamic> json) =
      _$StatisticsModelImpl.fromJson;

  @override
  List<StatisticModel>? get statistics;
  set statistics(List<StatisticModel>? value);

  /// Create a copy of StatisticsModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticsModelImplCopyWith<_$StatisticsModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

StatisticModel _$StatisticModelFromJson(Map<String, dynamic> json) {
  return _StatisticModel.fromJson(json);
}

/// @nodoc
mixin _$StatisticModel {
  String get id => throw _privateConstructorUsedError;
  DateTime get start => throw _privateConstructorUsedError;
  DateTime get stop => throw _privateConstructorUsedError;

  /// Serializes this StatisticModel to a JSON map.
  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;

  /// Create a copy of StatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  $StatisticModelCopyWith<StatisticModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $StatisticModelCopyWith<$Res> {
  factory $StatisticModelCopyWith(
          StatisticModel value, $Res Function(StatisticModel) then) =
      _$StatisticModelCopyWithImpl<$Res, StatisticModel>;
  @useResult
  $Res call({String id, DateTime start, DateTime stop});
}

/// @nodoc
class _$StatisticModelCopyWithImpl<$Res, $Val extends StatisticModel>
    implements $StatisticModelCopyWith<$Res> {
  _$StatisticModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  /// Create a copy of StatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? stop = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$StatisticModelImplCopyWith<$Res>
    implements $StatisticModelCopyWith<$Res> {
  factory _$$StatisticModelImplCopyWith(_$StatisticModelImpl value,
          $Res Function(_$StatisticModelImpl) then) =
      __$$StatisticModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, DateTime start, DateTime stop});
}

/// @nodoc
class __$$StatisticModelImplCopyWithImpl<$Res>
    extends _$StatisticModelCopyWithImpl<$Res, _$StatisticModelImpl>
    implements _$$StatisticModelImplCopyWith<$Res> {
  __$$StatisticModelImplCopyWithImpl(
      _$StatisticModelImpl _value, $Res Function(_$StatisticModelImpl) _then)
      : super(_value, _then);

  /// Create a copy of StatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? stop = null,
  }) {
    return _then(_$StatisticModelImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as DateTime,
      stop: null == stop
          ? _value.stop
          : stop // ignore: cast_nullable_to_non_nullable
              as DateTime,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$StatisticModelImpl implements _StatisticModel {
  const _$StatisticModelImpl(
      {required this.id, required this.start, required this.stop});

  factory _$StatisticModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$StatisticModelImplFromJson(json);

  @override
  final String id;
  @override
  final DateTime start;
  @override
  final DateTime stop;

  @override
  String toString() {
    return 'StatisticModel(id: $id, start: $start, stop: $stop)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$StatisticModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.stop, stop) || other.stop == stop));
  }

  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  int get hashCode => Object.hash(runtimeType, id, start, stop);

  /// Create a copy of StatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @override
  @pragma('vm:prefer-inline')
  _$$StatisticModelImplCopyWith<_$StatisticModelImpl> get copyWith =>
      __$$StatisticModelImplCopyWithImpl<_$StatisticModelImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$StatisticModelImplToJson(
      this,
    );
  }
}

abstract class _StatisticModel implements StatisticModel {
  const factory _StatisticModel(
      {required final String id,
      required final DateTime start,
      required final DateTime stop}) = _$StatisticModelImpl;

  factory _StatisticModel.fromJson(Map<String, dynamic> json) =
      _$StatisticModelImpl.fromJson;

  @override
  String get id;
  @override
  DateTime get start;
  @override
  DateTime get stop;

  /// Create a copy of StatisticModel
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  _$$StatisticModelImplCopyWith<_$StatisticModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
