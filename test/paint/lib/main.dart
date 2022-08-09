import 'package:flutter/material.dart';


Future<void>  main() async {
  print('Bat dau goi do an');
  print(goiDoAn());
}



Future<String> goiDoAn() async{
  var monAn = lamonAn();
  return 'Mon an $monAn ';
}

Future<String> lamonAn(){
  return Future.delayed(const Duration(seconds: 5), () => 'com ga');
}


