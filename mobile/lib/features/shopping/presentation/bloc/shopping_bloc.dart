import 'dart:async';
import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
part 'shopping_event.dart';
part 'shopping_state.dart';
class ShoppingBloc extends Bloc<ShoppingEvent, ShoppingState> {
  ShoppingBloc() : super(ShoppingInitial());
  @override
  Stream<ShoppingState> mapEventToState(
    ShoppingEvent event,
  ) async* {
    // TODO: implement mapEventToState
  }
}
