abstract class HomeState {}

class InitHomeState extends HomeState {}

class GetNoteState extends HomeState {
  final int time;

  GetNoteState(this.time);
}

class SetNoteState extends HomeState {
  final int time;

  SetNoteState({this.time});
}
