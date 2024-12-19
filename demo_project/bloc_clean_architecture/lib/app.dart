import 'package:bloc_clean_architecture/blocs/user_bloc/user_bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:user_repository/user_repository.dart';

import 'app_view.dart';

class MyApp extends StatelessWidget {
  final FirebaseUserRepository userRepository;

  MyApp({required this.userRepository});

  @override
  Widget build(BuildContext context) {
    return MultiRepositoryProvider(
      providers: [
        RepositoryProvider<UserBloc>(
          create: (_) => UserBloc(
            userRepository: userRepository,
          ),
        )
      ],
      child: const AppView(),
    );
  }
}
