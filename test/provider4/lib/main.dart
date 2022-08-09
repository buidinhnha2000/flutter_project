import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:provider4/models/counter.dart';
import 'package:provider4/settings.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => MySettings()),
        ChangeNotifierProvider(create: (_) => Counter())
      ],
      child: MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Calculator',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        brightness: context.watch<MySettings>().isDark 
        ? Brightness.dark
        : Brightness.light,
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
    );
  }
}
class MyHomePage extends StatelessWidget {
  const MyHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Flutter'),
        actions: [
          Switch(
            value: context.watch<MySettings>().isDark, 
            onChanged: (newValue){
              Provider.of<MySettings>(context, listen: false)
              .setBrightness(newValue);
            })
        ]),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text('You have busherd the button this many times'),
              Text(
                context.watch<Counter>().myValue.toString(),
                style: Theme.of(context).textTheme.headline4,
              )
            ],
          )),
          floatingActionButton: FloatingActionButton(
            child: Icon(Icons.add),
            onPressed:(){
              context.read<Counter>().add();
            } ),
    );
  }
}

