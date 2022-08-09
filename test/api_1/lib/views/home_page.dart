import 'package:api_1/services/remote_service.dart';
import 'package:flutter/material.dart';
import '../models/post.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Post>? posts;
  var isLoaded = false;
  @override
  void initState() {
    super.initState();

    getData();
  }
  getData() async {
    posts = await RemoteService().getPosts();
    if(posts != null){
      setState((){
        isLoaded = true;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Posts'),
      ),
      body: Visibility(
        visible: isLoaded,
        child: ListView.builder(
            itemCount: posts?.length,
            itemBuilder: (context, index){
              return Container(
                padding: const EdgeInsets.all(10),
                child: Row(
                  children: [
                    Container(
                      height: 80,
                      width: 80,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: Colors.blue,
                      ),
                    ),
                    SizedBox(width: 10,),
                    Expanded(
                      child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          posts![index].title,
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Text(
                          posts![index].body ?? '',
                          maxLines: 3,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            fontSize: 15,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ],
                    ),)
                  ],
                ),
              );
            }
        ),
        replacement: const Center(
          child: CircularProgressIndicator(),
        ),
      ),
    );
  }
}

