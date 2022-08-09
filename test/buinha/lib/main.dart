import 'package:flutter/material.dart';

void main() => runApp(const FlowApp());
class FlowApp extends StatelessWidget {
  const FlowApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Gycros(),
      ],
    );
  }
}
class Gycros extends StatelessWidget {
  const Gycros({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}

