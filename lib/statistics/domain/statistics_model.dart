import 'package:freezed_annotation/freezed_annotation.dart';

part 'statistics_model.freezed.dart';

part 'statistics_model.g.dart';

@unfreezed
class StatisticsModel with _$StatisticsModel {
  factory StatisticsModel({
   List<StatisticModel>? statistics,
  }) = _StatisticsModel;

  factory StatisticsModel.fromJson(Map<String, dynamic> json) => _$StatisticsModelFromJson(json);
}

@freezed
class StatisticModel with _$StatisticModel {
  const factory StatisticModel({
    required String id,
    required DateTime start,
    required DateTime stop,
  }) = _StatisticModel;

  factory StatisticModel.fromJson(Map<String, dynamic> json) => _$StatisticModelFromJson(json);
}
