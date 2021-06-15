import 'package:forum_manha/core/global/user.dart';
import 'package:forum_manha/modules/posts/models/comment_model.dart';
import 'package:forum_manha/modules/posts/models/post_model.dart';
import 'package:forum_manha/modules/posts/repositories/posts_repository.dart';
import 'package:mobx/mobx.dart';

part 'posts_detail_controller.g.dart';

class PostsDetailController = _PostsDetailControllerBase
    with _$PostsDetailController;

abstract class _PostsDetailControllerBase with Store {
  final PostsRepository _repository;
  final User _user;

  _PostsDetailControllerBase(this._repository, this._user);

  @observable
  ObservableList<CommentModel> commentsList = ObservableList.of([]);

  @observable
  String comment = '';

  @action
  void setComment(value) => comment = value;

  @action
  Future createComment() async {
    final commentModel = CommentModel(
      description: comment,
      userId: _user.objectId,
      postId: post!.id!,
    );
    await _repository.createComment(commentModel);
    comment = '';
  }

  @observable
  PostModel? post;

  @action
  void setPost(value) => post = value;

  @action
  Future incrementViews() async {
    await _repository.incrementPostView(post!);
  }

  @action
  Future fetchCommentsByPostId() async {}
}
