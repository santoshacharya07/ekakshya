import 'package:ekaksha/pages/application/bloc/app_events.dart';
import 'package:ekaksha/pages/application/bloc/app_states.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AppBlocs extends Bloc<AppEvent, AppState> {
  AppBlocs() : super(const AppState()) {
    on<TriggerAppEvent>((event, eimt) {
      // print("my tapped index is${event.index}");
      emit(AppState(index: event.index));
    });
  }
}
