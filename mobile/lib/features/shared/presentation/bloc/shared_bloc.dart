import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'shared_event.dart';
part 'shared_state.dart';
class SharedBloc extends Bloc<SharedEvent, SharedState> {
  SharedBloc() : super(SharedInitial());
  @override
  Stream<SharedState> mapEventToState(
    SharedEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
