import 'package:flutter_bloc/flutter_bloc.dart';

import 'home_event.dart';
import 'home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(HomeInitial()) {
    on<HomeStarted>(
      (event, emit) {},
    );
    on<HomeSearchItems>(
      (event, emit) {},
    );
    on<HomeFilterItems>(
      (event, emit) {},
    );
    on<HomeItemLiked>(
      (event, emit) {},
    );
    on<HomeItemClicked>(
      (event, emit) {},
    );
  }
}
