import 'package:first_bloc_project/bloc/increment_bloc.dart';
import 'package:first_bloc_project/bloc/increment_event.dart';
import 'package:first_bloc_project/bloc/increment_state.dart';
import 'package:first_bloc_project/wrapper.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: Wrapper(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            BlocBuilder<IncrementBloc, IncrementState>(
              builder: (BuildContext context, state) => Text(
                '${state.counter}',
                style: Theme.of(context).textTheme.headlineMedium,
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {
                    BlocProvider.of<IncrementBloc>(context).add(AddEvent());
                  },
                  icon: Icon(Icons.add),
                ),
                IconButton(
                  onPressed: () {
                    BlocProvider.of<IncrementBloc>(context).add(RemoveEvent());
                  },
                  icon: Icon(Icons.remove),
                ),
                IconButton(
                  onPressed: () {
                    context.read<IncrementBloc>().add(ResetEvent());
                  },
                  icon: Icon(Icons.settings_backup_restore),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
