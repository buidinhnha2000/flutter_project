
import 'dart:html';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(ChangeNotifierProvider(
    create: (context) => MySettings(),
    child: MaterialApp(
      home: MyApp(),),
  ));
}

class MySettings extends ChangeNotifier{
  String text = 'Done';
  Color color = Colors.red;

  void changeText() {
    if (text == 'Hello') {
      text = 'wwww';
    }else{
      text = 'Hello' ;
    }
    notifyListeners();
  }

  void changeColor(){
    if (color == Colors.blue) {
      color = Colors.red;
    } else {
      color = Colors.blue;
    }
    notifyListeners();
  }
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Consumer<MySettings>( builder: ((context, MySettings, child){
      return Scaffold(
        appBar: AppBar(title: Text('Provider Demo'),
        backgroundColor: MySettings.color,),
        drawer: Drawer(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                ElevatedButton(onPressed: (){
                  MySettings.changeColor();
                  Navigator.pop(context);
                }, child: Text('Change Color')),
                ElevatedButton(onPressed: (){
                  MySettings.changeText();
                  Navigator.pop(context);
                }, child: Text('Change Text'))            ],
            )),
        ),
        body: Center(
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              ElevatedButton(
                onPressed: () {
                  MySettings.changeText();
                }, 
                child: Text('Change Text')
              ),
              Text('${MySettings.text}')
            ],
          ),
        ),
      );
      })
    );
  }
}
