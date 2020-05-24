import 'package:dann_post/ModelsAndServices/enums/viewstate.dart';
import 'package:dann_post/ModelsAndServices/models/post.dart';
import 'package:dann_post/ModelsAndServices/services/api.dart';
import 'package:dann_post/locator.dart';

import 'base_model.dart';

class HomeModel extends BaseModel {
  Api _api = locator<Api>();

  List<Post> posts;

  Future getPosts(int userId) async {
    setState(ViewState.Busy);
    posts = await _api.getPostsForUser(userId);
    setState(ViewState.Idle);
  }
}