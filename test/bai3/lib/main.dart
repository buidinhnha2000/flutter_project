import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => CounterProvider() ,
      child: MaterialApp(
        home: HomeScreen(),
      ),
      )
    );
  
}

class CounterProvider extends ChangeNotifier{
  int _counter = 10000;
  int get counter => _counter;
  void add(){
    _counter = _counter + 100;
    notifyListeners();
  }
}
class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Home Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.push(context, MaterialPageRoute(
                  builder: (_) => SecondScreen()));
              }, 
              child: Text('Second Screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        context.read<CounterProvider>().add();
        },
        child: Icon(Icons.add),
        ),

    );
  }
}
class SecondScreen extends StatelessWidget {
  const SecondScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Second Screen')),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              context.watch<CounterProvider>().counter.toString(),
              style: TextStyle(fontSize: 50),
            ),
            ElevatedButton(
              onPressed: (){
                Navigator.pop(context);
              }, 
              child: Text('Home Screen'))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: (){
        context.read<CounterProvider>().add();
        },
        child: Icon(Icons.add),
        ),

    );
  }
}

