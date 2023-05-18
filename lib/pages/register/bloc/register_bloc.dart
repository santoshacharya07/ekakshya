import 'package:ekaksha/pages/register/bloc/register_event.dart';
import 'package:ekaksha/pages/register/bloc/register_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class RegisterBloc extends Bloc<RegisterEvent, RegisterStates> {
  RegisterBloc() : super(const RegisterStates()) {
    on<UserNameEvent>(_userNameEvent);
    on<EmailEvent>(_emailEvent);
    on<PasswordEvent>(_passeordEvent);
    on<RePasswordEvent>(_rePasswordEvent);
  }
  void _userNameEvent(UserNameEvent event, Emitter<RegisterStates> emit) {
    print(event.userName);
    emit(state.copyWith(userName: event.userName));
  }

  void _emailEvent(EmailEvent event, Emitter<RegisterStates> emit) {
    print(event.email);
    emit(state.copyWith(email: event.email));
  }

  void _passeordEvent(PasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.password);
    emit(state.copyWith(password: event.password));
  }

  void _rePasswordEvent(RePasswordEvent event, Emitter<RegisterStates> emit) {
    print(event.rePassword);
    emit(state.copyWith(rePassword: event.rePassword));
  }
}
