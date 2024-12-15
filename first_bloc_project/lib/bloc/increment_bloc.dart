import 'package:first_bloc_project/bloc/increment_event.dart';
import 'package:first_bloc_project/bloc/increment_state.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class IncrementBloc extends Bloc<IncrementEvent, IncrementState> {
  IncrementBloc() : super(IncrementState()) {
    on<AddEvent>((event, emit) => _mapAddLogic(event, emit));
    on<RemoveEvent>((event, emit) => _mapRemoveLogic(event, emit));
    on<ResetEvent>((event, emit) => _mapResetLogic(event, emit));
  }

  void _mapAddLogic(AddEvent event, Emitter<IncrementState> emit) {
    var updatedData = state.counter + 1;
    emit(state.copyWith(counter: updatedData));
  }

  void _mapRemoveLogic(RemoveEvent event, Emitter<IncrementState> emit) {
    var updatedData = state.counter - 1;
    emit(state.copyWith(counter: updatedData));
  }

  void _mapResetLogic(ResetEvent event, Emitter<IncrementState> emit) {
    emit(state.copyWith(counter: 0));
  }
}
