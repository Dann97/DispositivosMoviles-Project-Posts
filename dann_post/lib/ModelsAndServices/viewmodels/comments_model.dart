import 'package:dann_post/ModelsAndServices/enums/viewstate.dart';
import 'package:dann_post/ModelsAndServices/models/comment.dart';
import 'package:dann_post/ModelsAndServices/services/api.dart';

import '../../locator.dart';
import 'base_model.dart';

class CommentsModel extends BaseModel {
  Api _api = locator<Api>();

  List<Comment> comments;

  Future fetchComments(int postId) async {
    setState(ViewState.Busy);
    comments = await _api.getCommentsForPost(postId);
    setState(ViewState.Idle);
  }
}