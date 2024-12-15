import 'package:hydrated_bloc/hydrated_bloc.dart';

import 'counter_state.dart';

/// We can use either extends HydratedCubit<CounterState> or with HydratedMixin.

class CounterCubit extends HydratedCubit<CounterState> {
  CounterCubit()
      : super(CounterState(counterValue: 0, wasIncremented: true));

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

  @override
  CounterState fromJson(Map<String, dynamic> json) {
    return CounterState.fromMap(json);
  }

  @override
  Map<String, dynamic> toJson(CounterState state) {
    return state.toMap();
  }
}