import 'package:flutter/material.dart';
import 'package:testing/widget/no_users_screen.dart';
import 'package:testing/widget/stream_screen.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        title: 'Flutter Testing',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        home: StreamScreen());
  }
}
