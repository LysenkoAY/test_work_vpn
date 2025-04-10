// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'statistics_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$StatisticsModelImpl _$$StatisticsModelImplFromJson(
        Map<String, dynamic> json) =>
    _$StatisticsModelImpl(
      statistics: (json['statistics'] as List<dynamic>?)
          ?.map((e) => StatisticModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$StatisticsModelImplToJson(
        _$StatisticsModelImpl instance) =>
    <String, dynamic>{
      'statistics': instance.statistics,
    };

_$StatisticModelImpl _$$StatisticModelImplFromJson(Map<String, dynamic> json) =>
    _$StatisticModelImpl(
      id: json['id'] as String,
      start: DateTime.parse(json['start'] as String),
      stop: DateTime.parse(json['stop'] as String),
    );

Map<String, dynamic> _$$StatisticModelImplToJson(
        _$StatisticModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start.toIso8601String(),
      'stop': instance.stop.toIso8601String(),
    };
