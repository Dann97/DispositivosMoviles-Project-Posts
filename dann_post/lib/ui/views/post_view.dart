import 'package:dann_post/ui/shared/ui_helpers.dart';
import 'package:flutter/material.dart';
//import 'package:provider/provider.dart';
import 'package:dann_post/core/models/post.dart';
//import 'package:dann_post/core/models/user.dart';
//import 'package:dann_post/ui/shared/app_colors.dart';
//import 'package:dann_post/ui/shared/text_styles.dart';
//import 'package:dann_post/ui/shared/ui_helpers.dart';
import 'package:dann_post/ui/widgets/comments.dart';

class PostView extends StatelessWidget {
  final Post post;
  PostView({this.post});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.grey,
        title: Text("Twetts",style: TextStyle(color: Colors.black),),
      ),
     // backgroundColor: backgroundColor,
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
          
        //padding: const EdgeInsets.symmetric(horizontal: 10.0),
        // Column(
          
          children: <Widget>[
            
            Container(
              decoration: BoxDecoration(
            color: Colors.blueGrey,
            borderRadius: BorderRadius.circular(0.0),
            boxShadow: [
              BoxShadow(
                  blurRadius: 0.0,
                  offset: Offset(0.0, 0.0),
                  color: Color.fromARGB(80, 0, 0, 0))
            ]),
              margin: EdgeInsets.symmetric(horizontal: 0.0, vertical: 0.0),
              padding: EdgeInsets.all(15.0),
              
              child: Card(
                color: Colors.blueGrey,
                elevation:5,
                child: Column(
                  
                  children:<Widget>[
                    ListTile(
                      leading: CircleAvatar(backgroundImage:AssetImage("images/icono.png"),radius: 30.0,),
            //UIHelper.verticalSpaceLarge(),
            title:Text(post.title, style: TextStyle(fontWeight: FontWeight.w900, fontSize: 20.0),),
                ),], ),
              ),
            ),
            // Text(
            //   'by ${Provider.of<User>(context).name}',
            //   style: TextStyle(fontSize: 9.0),
            // ),
            //UIHelper.verticalSpaceMedium(),
            
            //Text(post.body),
            UIHelper.horizontalSpaceLarge(),
            Comments(post.id)
            
          ],
          
         
        //),
      ),
    );
  }
}


