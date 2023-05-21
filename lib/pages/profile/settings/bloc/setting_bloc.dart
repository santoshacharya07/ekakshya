import 'package:ekaksha/pages/profile/settings/bloc/setting_events.dart';
import 'package:ekaksha/pages/profile/settings/bloc/setting_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class SettingBloc extends Bloc<SettingEvents, SettingStates> {
  SettingBloc() : super(const SettingStates()) {
    on<TriggerSetting>(_triggerSettings);
  }
  _triggerSettings(SettingEvents events, Emitter<SettingStates> emit) {
    emit(const SettingStates());
  }
}
