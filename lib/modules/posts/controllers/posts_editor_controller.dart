import 'package:dartz/dartz.dart';
import 'package:mobx/mobx.dart';

import '../../../core/configs/app_errors.dart';
import '../models/post_model.dart';
import '../repositories/posts_repository.dart';

part 'posts_editor_controller.g.dart';

class PostsEditorController = _PostsEditorControllerBase
    with _$PostsEditorController;

abstract class _PostsEditorControllerBase with Store {
  final PostsRepository _repository;

  _PostsEditorControllerBase(this._repository);

  @observable
  String? id;

  @action
  void setId(value) => id = value;

  @observable
  String title = '';

  @action
  void setTitle(value) => title = value;

  @observable
  String description = '';

  @action
  void setDescription(value) => description = value;

  @action
  Future<Either<Failure, bool>> save() async {
    final post = PostModel(
      id: id,
      title: title,
      description: description,
      userId: 'zWLWNXuEa8',
    );

    if (id == null) {
      return await _repository.createPost(post);
    } else {
      return await _repository.updatePost(post);
    }
  }
}
