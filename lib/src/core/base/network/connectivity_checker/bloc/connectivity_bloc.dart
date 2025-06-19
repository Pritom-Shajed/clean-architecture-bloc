import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:template/src/core/base/network/enum/connectivity_status.dart';

part 'connectivity_bloc.freezed.dart';
part 'connectivity_event.dart';
part 'connectivity_state.dart';

/// Bloc responsible for monitoring internet connectivity status.
class ConnectivityBloc extends Bloc<ConnectivityEvent, ConnectivityState> {
  final Connectivity _connectivity;
  late final StreamSubscription _subscription;

  /// Initializes the [ConnectivityBloc].
  /// Sets up a subscription to connectivity changes and triggers an initial check.
  ConnectivityBloc({Connectivity? connectivity})
      : _connectivity = connectivity ?? Connectivity(),
        super(const ConnectivityState()) {
    on<_Started>(_onStarted);
    on<_Changed>(_onChanged);

    // Listen to connectivity changes in real-time and dispatch events.
    _subscription = _connectivity.onConnectivityChanged.listen((result) => add(ConnectivityEvent.changed(result)));

    // Perform an initial connectivity check.
    add(const ConnectivityEvent.started());
  }

  /// Handles the [_Started] event.
  /// Performs a one-time connectivity check when the bloc is first created.
  Future<void> _onStarted(_Started event, Emitter<ConnectivityState> emit) async {
    final result = await _connectivity.checkConnectivity();
    _handleConnectivityResult(result, emit); // Wrap in a list for consistency
  }

  /// Handles the [_Changed] event.
  /// Updates state whenever a new connectivity result is emitted.
  void _onChanged(_Changed event, Emitter<ConnectivityState> emit) {
    _handleConnectivityResult(event.result, emit); // Wrap in a list for consistency
  }

  /// Maps [ConnectivityResult]s to a [ConnectionStatus] and emits updated state.
  void _handleConnectivityResult(List<ConnectivityResult> result, Emitter<ConnectivityState> emit) {
    final isConnected = result.contains(ConnectivityResult.ethernet) ||
        result.contains(ConnectivityResult.wifi) ||
        result.contains(ConnectivityResult.mobile);

    emit(state.copyWith(status: isConnected ? ConnectionStatus.connected : ConnectionStatus.disconnected));
  }

  /// Cleans up the stream subscription when the bloc is closed.
  @override
  Future<void> close() async {
    await _subscription.cancel();
    return super.close();
  }
}
