
import 'package:flutter/material.dart';
import 'package:rest_api/api_call.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {

  late Future<Users> users;

  @override
  void initState(){
    super.initState();
    users = getUsers();
  }
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Api call in Flutter'),
          centerTitle: true,
        ),
        body: Center(
          child: FutureBuilder<Users>(
            future: users,
            builder: (context, snapshot){
              if(snapshot.hasData){
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(snapshot.data!.name),
                    Text(snapshot.data!.username),
                    Text(snapshot.data!.email),
                  ],
                );
              }else if(snapshot.hasError){
                return Text(snapshot.error.toString());
              }else{
                return CircularProgressIndicator();
              }
            },
          ),
        ),
      ),
    );
  }
}



