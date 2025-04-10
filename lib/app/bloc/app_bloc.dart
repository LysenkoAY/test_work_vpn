import 'dart:convert';

import 'package:firebase_analytics/firebase_analytics.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:intl/intl.dart';
import 'package:uuid/uuid.dart';

import '../../statistics/domain/statistics_model.dart';

part 'appl_state.dart';

part 'appl_event.dart';

part 'app_bloc.freezed.dart';

@injectable
class AppBloc extends Bloc<AppEvent, AppState> {
  final ValueNotifier<VPNStatus> status;

  AppBloc(this.status) : super(const AppState.loading()) {
    on<_InitialEvent>(_onInitial);
    on<_StartEvent>(_onStartEvent);
    on<_StopEvent>(_onStopEvent);
  }

  void _onInitial(
    _InitialEvent event,
    Emitter<AppState> emit,
  ) async {
    emit(const AppState.success());
  }

  final _storage = const FlutterSecureStorage();
  late DateTime startSession;
  static FirebaseAnalytics analytics = FirebaseAnalytics.instance;

  Future<void> _onStartEvent(_StartEvent event, Emitter<AppState> emit) async {
    status.value = VPNStatus.connection;
    await connect();
    startSession = DateTime.now();
    status.value = VPNStatus.started;
  }

  Future<void> _onStopEvent(_StopEvent event, Emitter<AppState> emit) async {
    await stop();
    status.value = VPNStatus.stopped;
    await saveStatistics();
  }

  Future<void> connect() async {
    await Future.delayed(const Duration(seconds: 5));
  }

  Future<void> stop() async {}

  Future<void> saveStatistics() async {
    var uuid = Uuid();
    String? jsonString;
    StatisticsModel statistics;
    jsonString = await _storage.read(key: 'sessions');
    if (jsonString != null) {
      statistics = StatisticsModel.fromJson(json.decode(jsonString));
      if (statistics.statistics!.length >= 5) {
        statistics.statistics!.removeAt(0);
      }
    } else {
      statistics = StatisticsModel(statistics: []);
    }
    final statistic = StatisticModel(id: uuid.v4(), start: startSession, stop: DateTime.now());
    statistics.statistics!.add(statistic);
    jsonString = json.encode(statistics.toJson());
    await _storage.write(key: 'sessions', value: jsonString);

    await analytics.logEvent(name: 'vpn_log', parameters: <String, Object>{
      'id': statistic.id,
      'start': DateFormat('dd.MM.yyyy HH:mm:ss').format(statistic.start),
      'stop': DateFormat('dd.MM.yyyy HH:mm:ss').format(statistic.stop),
    });
  }
}
