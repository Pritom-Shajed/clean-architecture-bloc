import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'home_bloc.freezed.dart';
part 'home_event.dart';
part 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(const HomeState.initial()) {
    on<_HomeStarted>(_onHomeStarted);
  }

  void _onHomeStarted(
    _HomeStarted event,
    Emitter<HomeState> emit,
  ) {
    emit(const HomeState.initial());
  }
}
