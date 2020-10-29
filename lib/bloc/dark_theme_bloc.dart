import 'package:bloc/bloc.dart';

class DarkThemeBloc extends Bloc<bool, bool> {
  DarkThemeBloc(bool initialState) : super(initialState);

  @override
  Stream<bool> mapEventToState(bool event) async* {
    yield event;
  }
}
