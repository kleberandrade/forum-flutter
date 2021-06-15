import 'package:forum_manha/modules/posts/models/comment_model.dart';
import 'package:forum_manha/modules/posts/repositories/posts_repository.dart';
import 'package:mobx/mobx.dart';

part 'posts_detail_controller.g.dart';

class PostsDetailController = _PostsDetailControllerBase
    with _$PostsDetailController;

abstract class _PostsDetailControllerBase with Store {
  final PostsRepository _repository;

  _PostsDetailControllerBase(this._repository);

  @observable
  ObservableList<CommentModel> commentsList = ObservableList.of([]);

  @observable
  String comment = '';

  @action
  void setComment(value) => comment = value;

  @action
  Future createComment() async {
    comment = '';
  }

  @action
  Future fetchCommentsByPostId() async {}
}
