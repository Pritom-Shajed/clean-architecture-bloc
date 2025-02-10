part of 'theme_bloc.dart';

class ThemeState {
  final ThemeProfile theme;

  ThemeState({required this.theme});

  // Copy method (since we are not using Equatable)
  ThemeState copyWith({ThemeProfile? theme}) {
    return ThemeState(theme: theme ?? this.theme);
  }
}
