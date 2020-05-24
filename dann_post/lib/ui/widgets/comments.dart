//import 'package:dann_post/ui/shared/app_colors.dart';
//import 'package:dann_post/ui/shared/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:dann_post/ModelsAndServices/enums/viewstate.dart';
import 'package:dann_post/ModelsAndServices/models/comment.dart';
import 'package:dann_post/ModelsAndServices/viewmodels/comments_model.dart';
//import 'package:dann_post/ui/shared/app_colors.dart';
//import 'package:dann_post/ui/shared/ui_helpers.dart';
import 'package:dann_post/ui/views/base_view.dart';

class Comments extends StatelessWidget {
  final int postId;
  Comments(this.postId);

  @override
  Widget build(BuildContext context) {
    return BaseView<CommentsModel>(
   
      onModelReady: (model) => model.fetchComments(postId),
      builder: (context, model, child) => model.state == ViewState.Busy
      ? Center(child: CircularProgressIndicator())
      : Expanded(child: ListView(
               
        
        children: model.comments
                  .map((comment) => CommentItem(comment)).toList(),
      ),)
    );
  }
}

/// Renders a single comment given a comment model
class CommentItem extends StatelessWidget {
  final Comment comment;
  const CommentItem(this.comment);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.stretch,
      children: <Widget>[
       Container(
         decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(0.0), color: Colors.grey),
      padding: EdgeInsets.all(10.0),
      margin: EdgeInsets.symmetric(vertical: 0.0),
      //margin: EdgeInsets.only(left:15),
      child: Card(
        elevation: 10,
       
     
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        
        children: <Widget>[
          ListTile(
            leading: CircleAvatar(backgroundImage:AssetImage("images/icono2.jpg")),
          title:Text(
            comment.name,
            style: TextStyle(fontWeight: FontWeight.bold),
          ),
          //UIHelper.verticalSpaceSmall(),
            subtitle:  Text(comment.body),
          ),
        ],
      ),
      ),
      ),
      ],
    );
  }
}