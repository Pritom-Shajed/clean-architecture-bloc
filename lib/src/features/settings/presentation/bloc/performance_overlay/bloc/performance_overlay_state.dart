part of 'performance_overlay_bloc.dart';

class PerformanceOverlayState {
  final bool isEnabled;

  PerformanceOverlayState({required this.isEnabled});

  // Copy method (since we are not using Equatable)
  PerformanceOverlayState copyWith({bool? isEnabled}) {
    return PerformanceOverlayState(isEnabled: isEnabled ?? this.isEnabled);
  }
}

