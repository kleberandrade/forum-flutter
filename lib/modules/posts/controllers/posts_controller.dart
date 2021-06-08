import 'package:forum_manha/modules/posts/models/post_model.dart';
import 'package:forum_manha/modules/posts/repositories/posts_repository.dart';
import 'package:mobx/mobx.dart';
part 'posts_controller.g.dart';

class PostsController = _PostsControllerBase with _$PostsController;

abstract class _PostsControllerBase with Store {
  final PostsRepository _repository;

  _PostsControllerBase(this._repository);

  @observable
  ObservableList<PostModel> postList = ObservableList.of([]);

  @computed
  int get length => postList.length;

  @action
  Future fetch() async {
    final result = await _repository.readPosts();
    result.fold(
      (_) => postList.clear(),
      (data) => postList = data.asObservable(),
    );
  }
}
