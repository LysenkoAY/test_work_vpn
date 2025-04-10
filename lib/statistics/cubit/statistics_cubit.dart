import 'dart:convert';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:test_work_vpn/statistics/cubit/statistics_state.dart';

import '../domain/statistics_model.dart';

class StatisticsCubit extends Cubit<StatisticsState> {
  StatisticsCubit() : super(StatisticsState(statistics: []));

  Future<void> readStatistics() async {
    emit(StatisticsState(statistics: await _readStatistics()));
  }

  final _storage = const FlutterSecureStorage();

  Future<List<StatisticModel>> _readStatistics() async {
    String? jsonString = await _storage.read(key: 'sessions');

    if (jsonString != null) {
      Map<String, dynamic> jsonMap = json.decode(jsonString);
      return StatisticsModel.fromJson(jsonMap).statistics!;
    }
    return [];
  }
}
