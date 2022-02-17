import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_research/screen/home/home_event.dart';
import 'package:flutter_research/screen/home/home_state.dart';

class HomeBloc extends Bloc<HomeEvent, HomeState> {
  HomeBloc() : super(InitHomeState());

  @override
  Stream<HomeState> mapEventToState(HomeEvent event) async* {
    state.runtimeType;
    switch (event.runtimeType) {
      case GetNoteEvent:
        yield GetNoteState(DateTime.now().microsecondsSinceEpoch);
        break;
      case SetNoteEvent:
        yield SetNoteState(time: DateTime.now().microsecondsSinceEpoch);
        break;
    }
  }
}
