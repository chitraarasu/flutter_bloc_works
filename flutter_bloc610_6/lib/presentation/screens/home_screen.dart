import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../constants/enums.dart';
import '../../logic/cubit/counter_cubit/counter_cubit.dart';
import '../../logic/cubit/counter_cubit/counter_state.dart';
import '../../logic/cubit/internet_cubit/internet_cubit.dart';
import '../../logic/cubit/internet_cubit/internet_state.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({required this.title, required this.color});

  final String title;
  final Color color;

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext homeScreenContext) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: widget.color,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            BlocBuilder<InternetCubit, InternetState>(
              builder: (internetCubitBuilderContext, state) {
                if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Wi-Fi',
                  );
                } else if (state is InternetConnected &&
                    state.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Mobile',
                  );
                } else if (state is InternetDisconnected) {
                  return Text(
                    'Disconnected',
                  );
                }
                return CircularProgressIndicator();
              },
            ),
            Divider(
              height: 5,
            ),
            BlocConsumer<CounterCubit, CounterState>(
              listener: (counterCubitListenerContext, state) {
              },
              builder: (counterCubiBuilderContext, state) {
                if (state.counterValue < 0) {
                  return Text(
                    'BRR, NEGATIVE ' + state.counterValue.toString(),
                  );
                } else if (state.counterValue % 2 == 0) {
                  return Text(
                    'YAAAY ' + state.counterValue.toString(),
                  );
                } else if (state.counterValue == 5) {
                  return Text(
                    'HMM, NUMBER 5',

                  );
                } else
                  return Text(
                    state.counterValue.toString(),
                  );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Builder(
              builder: (context) {
                final counterState = context.watch<CounterCubit>().state;
                final internetState = context.watch<InternetCubit>().state;

                if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Mobile) {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        ' Internet: Mobile',
                  );
                } else if (internetState is InternetConnected &&
                    internetState.connectionType == ConnectionType.Wifi) {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        ' Internet: Wifi',
                  );
                } else {
                  return Text(
                    'Counter: ' +
                        counterState.counterValue.toString() +
                        ' Internet: Disconnected',
                  );
                }
              },
            ),
            SizedBox(
              height: 24,
            ),
            Builder(
              builder: (context) {
                final counterValue = context
                    .select((CounterCubit cubit) => cubit.state.counterValue);
                return Text(
                  'Counter: ' + counterValue.toString(),
                );
              },
            ),
            SizedBox(
              height: 24,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                FloatingActionButton(
                  heroTag: Text('${widget.title}'),
                  onPressed: () {
                    BlocProvider.of<CounterCubit>(context).decrement();
                    // context.bloc<CounterCubit>().decrement();
                  },
                  tooltip: 'Decrement',
                  child: Icon(Icons.remove),
                ),
                FloatingActionButton(
                  heroTag: Text('${widget.title} 2nd'),
                  onPressed: () {
                    // BlocProvider.of<CounterCubit>(context).increment();
                    context.read<CounterCubit>().increment();
                  },
                  tooltip: 'Increment',
                  child: Icon(Icons.add),
                ),
              ],
            ),
            SizedBox(
              height: 24,
            ),
            Builder(
              builder: (materialButtonContext) => MaterialButton(
                color: Colors.redAccent,
                child: Text(
                  'Go to Second Screen',
                  style: TextStyle(color: Colors.white),
                ),
                onPressed: () {
                  Navigator.of(materialButtonContext).pushNamed(
                    '/second',
                  );
                },
              ),
            ),
            // SizedBox(
            //   height: 24,
            // ),
            MaterialButton(
              color: Colors.greenAccent,
              child: Text(
                'Go to Third Screen',
                style: TextStyle(color: Colors.white),
              ),
              onPressed: () {
                Navigator.of(homeScreenContext).pushNamed(
                  '/third',
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
