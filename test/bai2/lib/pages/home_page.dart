
import 'package:flutter/material.dart';

class Bai2 extends StatelessWidget {
  const Bai2({Key? key}) : super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container();
    Row(
  crossAxisAlignment: CrossAxisAlignment.center,
  children: [
    Expanded(
      child: Image.asset('images/pic1.jpg'),
    ),
    Expanded(
      flex: 2,
      child: Image.asset('images/pic2.jpg'),
    ),
    Expanded(
      child: Image.asset('images/pic3.jpg'),
    ),
  ],
);
  }
}