import 'package:first_bloc_project/bloc/increment_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import 'main.dart';

class Wrapper extends StatelessWidget {
  const Wrapper({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (BuildContext context) => IncrementBloc(),
      child: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}
