part of 'connectivity_bloc.dart';

@freezed
abstract class ConnectivityEvent with _$ConnectivityEvent {
    const factory ConnectivityEvent.started() = _Started;
  const factory ConnectivityEvent.changed(List<ConnectivityResult> result) = _Changed;
}