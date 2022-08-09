import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

void main() {
  debugRepaintRainbowEnabled = true;
  runApp(MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}



class _MyAppState extends State<MyApp> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(

      ),body: Center(
        child: Text('Dash is awesome'),
      ),
    );
  }
}