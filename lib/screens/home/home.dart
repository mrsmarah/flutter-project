import 'package:flutter/material.dart';
import 'package:flutter_app/screens/home/body.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
var url = 'https://jsonplaceholder.typicode.com/posts';

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

class Album {
  final int userId;
  final int id;
  final String title;
  final String body;

  Album({this.userId, this.id, this.title, this.body});

  factory Album.fromJson(Map<String, dynamic> json) {
    return Album(
      userId: json['userId'],
      id: json['id'],
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
  Future<List<Album>> futureAlbum;
  Future<List<Album>> fetchAlbum() async {
    final response = await http.get(url);
    if (response.statusCode == 200) {
      print(json.decode(response.body));
      List data = json.decode(response.body);
      return data.map((info) => new Album.fromJson(info)).toList();
//      return Album.fromJson(json.decode(response.body));
    } else {
      throw Exception('Failed to load album');
    }
  }

//  void getData() async{
//    var response = await http.get(url);
//    Map data = jsonDecode(response.body);
//    print(data['title']);
//  }

  @override
  void initState() {
    super.initState();
    futureAlbum =fetchAlbum();
//    getData();
  }

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<List<Album>>(
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
