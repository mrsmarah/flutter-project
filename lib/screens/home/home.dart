import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:flutter_app/storage/database.dart';
import 'package:flutter_app/storage/model.dart';


class Home extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Log(),
    );
  }
}

class Log extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Body(),
    );
  }
}

class Post {
  final int userId;
  final int id;
  final String title;
  final String body;

  Post({this.userId, this.id, this.title, this.body});

  factory Post.fromJson(Map<String, dynamic> json) {
    return Post(
      id: json['id'],
      userId: json['userId'],
      title: json['title'],
      body: json['body'],
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  Data createState() => Data();
}

class Data extends State<HomePage>{
  String url = 'https://jsonplaceholder.typicode.com/posts';

  Future<List<Post>> futureAlbum;/////////////
  List<Post> album;///////////////////////////

  Future<List<Post>> fetchAlbum() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      List data = json.decode(response.body);

//      return data.map((post) => DBHelper.add(Post.fromJson(post))).toList();

      return data.map((info) => new Post.fromJson(info)).toList();
    } else {
      throw Exception('Failed to load album');
    }
  }

  @override
  void initState() {
    super.initState();
    futureAlbum =fetchAlbum();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Post>>(
      future: futureAlbum,
      builder: (context, snapshot) {
        print("snapshot");
        print(snapshot.data);
        if (snapshot.hasData) {
          return Padding(
              padding: const EdgeInsets.all(8.0),
              child: GridView.builder(
                  itemCount: snapshot.data.length,
                  gridDelegate:SliverGridDelegateWithFixedCrossAxisCount( crossAxisCount: 2,),
                  itemBuilder:  (BuildContext context, int i){
                    return Card(
                      child: Container(
                        decoration: BoxDecoration(
                            border: Border.all(width: 0.5,color: Colors.grey)
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: <Widget>[
                              Text(snapshot.data[i].body)
                            ],
                          ),
                        ),
                      ),
                    );
                  }
              )
          );
        } else if (snapshot.hasError) {
          return Text("${snapshot.error}");
        }
// By default, show a loading spinner.
        return CircularProgressIndicator();
      },
    );
  }
}
