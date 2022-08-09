import 'package:flutter/material.dart';

void main() {
  runApp(  MyApp());
}

class MyApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHome(),
    );
  }
}
class MyHome extends StatefulWidget {

  @override
  State<MyHome> createState() => _MyHomeState();
}

class _MyHomeState extends State<MyHome> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Baseline(
        baseline: 200,
        baselineType: TextBaseline.alphabetic,
        child: Text("Hom nay"),

}


