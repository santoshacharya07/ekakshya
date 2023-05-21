import 'package:ekaksha/pages/home/bloc/home_page_event.dart';
import 'package:ekaksha/pages/home/bloc/home_page_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class HomePageBloc extends Bloc<HomePageEvents, HomePageStates> {
  HomePageBloc() : super(const HomePageStates()) {
    on<HomePageDots>(_homePageDots);
  }
  void _homePageDots(HomePageDots event, Emitter<HomePageStates> emit) {
    emit(state.copywith(index: event.index));
  }
}
