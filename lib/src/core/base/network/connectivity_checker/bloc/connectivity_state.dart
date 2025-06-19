part of 'connectivity_bloc.dart';

@freezed
abstract class ConnectivityState with _$ConnectivityState {
  const factory ConnectivityState({@Default(ConnectionStatus.disconnected) ConnectionStatus status}) =
      _ConnectivityState;
}
