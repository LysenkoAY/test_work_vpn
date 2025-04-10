part of 'app_bloc.dart';

@freezed
class AppEvent with _$AppEvent {
  const factory AppEvent.initial() = _InitialEvent;
  const factory AppEvent.start() = _StartEvent;
  const factory AppEvent.stop() = _StopEvent;
}