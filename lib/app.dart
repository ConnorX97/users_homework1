
import 'package:flutter/material.dart';
import 'package:homework_users/domain/provider/users_provider.dart';
import 'package:homework_users/views/home_view.dart';
import 'package:provider/provider.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => UserProvider(),
      child: const MaterialApp(
        debugShowCheckedModeBanner: false,
        home: HomeView(),
      ),
    );
  }
}