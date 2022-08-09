import 'package:flutter/material.dart';
import 'package:test_app/pages/home_pages.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Level ngu People',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home:  HomePage(title: '',),
    );
  }
}

