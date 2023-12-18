import 'package:bloc_app/app_events.dart';
import 'package:bloc_app/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvents, AppStates> {
  AppBlocs() : super(InitState()) {
    on<Increment>(
      (event, emit) {
        emit(
          AppStates(count: state.count + 1),
        );
      },
    );
    on<Decrement>(
      (event, emit) {
        emit(
          AppStates(count: state.count - 1),
        );
      },
    );
  }
}
