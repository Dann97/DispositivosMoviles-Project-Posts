import 'package:dann_post/http_services.dart';
import 'package:dann_post/post_detail.dart';
import 'package:dann_post/post_model.dart';
import 'package:flutter/material.dart';


 class PostsPage extends StatelessWidget{
   
   final HttpsService httpsService=HttpsService();
  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text("Dann Posts",style: TextStyle(color: Colors.blueGrey),),
      ),
      body: FutureBuilder(future: httpsService.getPosts(),
      builder:(BuildContext context, AsyncSnapshot<List<Post>> snapshot){
        if(snapshot.hasData){
          List<Post> posts = snapshot.data;

          return ListView(
            children: posts
            .map((Post post) => ListTile(
              leading: CircleAvatar(
                backgroundImage: AssetImage("images/icono.png"),
              ),
              title: Text(post.title),
              subtitle: Text(post.body),
              onTap: () => Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (context)=>PostDetail(
                    post: post,
                    ),
                    ),
              ),
              ),)
            .toList(),
          );
        }
        return Center(child: CircularProgressIndicator());
      }
      ),
      
    );
  }

}



