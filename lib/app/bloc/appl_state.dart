part of 'app_bloc.dart';

enum VPNStatus {
  stopped,
  connection,
  started,
}

@freezed
class AppState with _$AppState {
  const factory AppState.initial() = _Initial;

  const factory AppState.loading() = _Loading;

  const factory AppState.success() = _Success;

  const factory AppState.error(String errorMessage) = _Error;
}
