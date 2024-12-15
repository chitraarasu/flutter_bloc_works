import 'package:flutter_bloc/flutter_bloc.dart';

import 'counter_state.dart';

class CounterCubit extends Cubit<CounterState> {
  // InternetCubit internetCubit;

  // late StreamSubscription streamSubscription;

  CounterCubit(// {required this.internetCubit}
      )
      : super(CounterState(counterValue: 0, wasIncremented: true)) {
    /// There are totally two way to listen to another cubit one is StreamSubscription and another one is BlocListener.
    /// Below example is for StreamSubscription. Checkout home_screen for BlocListener.
    /// Its mandatory to close stream for StreamSubscription method.
    /// BlocListener need to add in UI code.

    // streamSubscription = internetCubit.stream.listen((data){
    //   if(data is InternetConnected && data.connectionType == ConnectionType.Wifi){
    //     increment();
    //   } else if(data is InternetConnected && data.connectionType == ConnectionType.Mobile) {
    //     decrement();
    //   }
    // });
  }

  void increment() => emit(
      CounterState(counterValue: state.counterValue + 1, wasIncremented: true));

  void decrement() => emit(CounterState(
      counterValue: state.counterValue - 1, wasIncremented: false));

// @override
// Future<void> close() {
//   streamSubscription.cancel();
//   return super.close();
// }
}
