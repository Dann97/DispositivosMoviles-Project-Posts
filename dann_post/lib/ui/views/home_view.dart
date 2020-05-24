import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:dann_post/core/enums/viewstate.dart';
import 'package:dann_post/core/models/post.dart';
import 'package:dann_post/core/models/user.dart';
import 'package:dann_post/core/viewmodels/home_model.dart';
import 'package:dann_post/ui/shared/app_colors.dart';
import 'package:dann_post/ui/shared/text_styles.dart';
import 'package:dann_post/ui/shared/ui_helpers.dart';
import 'package:dann_post/ui/widgets/postlist_item.dart';

import 'base_view.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {    
    return BaseView<HomeModel>(
            onModelReady: (model) => model.getPosts(Provider.of<User>(context).id),
      builder: (context, model, child) => Scaffold(
        backgroundColor: backgroundColor,
       
        body: model.state == ViewState.Busy
        ? Center(child: CircularProgressIndicator())
         : Column(
           
           crossAxisAlignment: CrossAxisAlignment.start,
           children: <Widget>[
               UIHelper.verticalSpaceLarge(),
             //Padding(
                             
              // padding: const EdgeInsets.only(left: 20.0),
               ListTile(
                     leading: CircleAvatar(backgroundImage: AssetImage("images/icono.png"),radius: 30,),     
              title:Text('Bienvenido ${Provider.of<User>(context).name}',
               style: headerStyle,),),
            // ),  
            
             Padding(
               
               padding: const EdgeInsets.only(left: 90.0),
               child: Text('Tus Posts',
                      style: subHeaderStyle),
             ),
            UIHelper.verticalSpaceSmall(),
            Expanded(              
              child: getPostsUi(
                model.posts
                ),
                ),
        ],
        ),
      ),
    );
  }

  Widget getPostsUi(List<Post> posts) => ListView.builder(
    itemCount: posts.length,
     itemBuilder: (context, index) => PostListItem(
      post: posts[index],
      onTap: () {
        Navigator.pushNamed(context, 'post', arguments: posts[index]);
      },
     )
  );
}
