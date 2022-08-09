import 'package:api_1/views/home_page.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'API 1',
      theme: ThemeData(
        primarySwatch: Colors.green
      ),
      home: const HomePage(),
    );
  }
}


