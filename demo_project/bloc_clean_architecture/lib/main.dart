import 'package:flutter/material.dart';
import 'package:user_repository/user_repository.dart';

import 'app.dart';

void main() {
  runApp(
    MyApp(
      userRepository: FirebaseUserRepository(),
    ),
  );
}
