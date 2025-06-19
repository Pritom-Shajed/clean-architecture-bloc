part of 'connectivity_bloc.dart';

@freezed
abstract class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({
    @Default(ConnectionStatus.loading) ConnectionStatus status,
  }) = _ConnectivityState;
}
