part of 'locale_bloc.dart';

class LocaleState {
  final LocaleProfile locale;

  LocaleState({required this.locale});

  // Copy method (since we are not using Equatable)
  LocaleState copyWith({LocaleProfile? locale}) {
    return LocaleState(locale: locale ?? this.locale);
  }
}
