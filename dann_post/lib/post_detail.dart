import 'package:dann_post/http_services.dart';
import 'package:dann_post/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class PostDetail extends StatelessWidget{
  final Post post;
  final HttpsService httpsService=HttpsService();
  PostDetail(
    {
      @required this.post,
    }
  );
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(post.title),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.delete),
            onPressed: () async {
              await httpsService.deletePost(post.id);
              Navigator.of(context).pop();
            },
            ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(12.0),
          child: Card(
            child: Column(
              children: <Widget>[
                ListTile(
                  title: Text("Title"),
                  subtitle: Text("${post.title}"),
                ), 
                ListTile(
                  title: Text("ID"),
                  subtitle: Text("${post.id}"),
                ),
                ListTile(
                  title: Text("Body"),
                  subtitle: Text("${post.body}"),
                ), 
                ListTile(
                  title: Text("User ID"),
                  subtitle: Text("${post.userId}"),
                ) , 
              ],
              )
          ),
          )),
    ) ;
  }
}