part of 'settings_bloc.dart';

class SettingsState {
  final AppSettings settings;

  SettingsState({required this.settings});

  // Copy method (since we are not using Equatable)
  SettingsState copyWith({AppSettings? settings}) {
    return SettingsState(settings: settings ?? this.settings);
  }
}