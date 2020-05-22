import 'package:dann_post/http_services.dart';
import 'package:dann_post/post_model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';


class PostDetail extends StatelessWidget{
  final Post post;
  //final Post post;
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
        title: Text('Tweets',style: TextStyle(color : Colors.blueGrey),),
        ),
        floatingActionButton: FloatingActionButton(
          child: Icon(
            Icons.delete),
            onPressed: () async {
              await httpsService.deletePost(post.id);
              Navigator.of(context).pop();
            },
            ),
      body: Column(
        //mainAxisAlignment:MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: <Widget>[
          Container(
            padding: EdgeInsets.all(15.0),
            
            child: Card(
              elevation: 10,
            child: Text("${post.title}",style: TextStyle(fontSize:18.0),),
            ),
          ),
          Container(
            padding: EdgeInsets.all(12.0),
            child: Card(
              elevation: 5,
              child:Column(
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
                    title: Text("ID"),
                     subtitle: Text("${post.userId}"),
                   ),
                ],
              ),
            
            ),
          ),
        ],
      ),

      
    ) ;
  }
}
