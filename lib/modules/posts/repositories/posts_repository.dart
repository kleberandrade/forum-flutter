import 'package:dartz/dartz.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

import '../../../core/configs/app_errors.dart';
import '../models/comment_model.dart';
import '../models/post_model.dart';

class PostsRepository {
  Future<Either<Failure, bool>> createPost(PostModel post) async {
    try {
      final data = ParseObject('Post')
        ..set('title', post.title.trim())
        ..set('description', post.description.trim())
        ..set('views', 0)
        ..set(
          'userId',
          (await ParseUser.currentUser()).toPointer(),
        );

      final response = await data.save();
      return Right(response.success);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, bool>> updatePost(PostModel post) async {
    try {
      final data = ParseObject('Post')
        ..objectId = post.id
        ..set('title', post.title)
        ..set('description', post.description);
      final response = await data.update();
      return Right(response.success);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, bool>> deletePost(PostModel post) async {
    try {
      final data = ParseObject('Post')..objectId = post.id;
      final response = await data.delete();
      return Right(response.success);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, List<PostModel>>> readPosts() async {
    try {
      final builder = QueryBuilder<ParseObject>(ParseObject('Post'));
      builder.orderByDescending('createdAt');
      final response = await builder.query();
      if (response.success && response.results != null) {
        final list = response.results as List<ParseObject>;
        final result = list.map((post) => PostModel.fromMap(post)).toList();
        return Right(result);
      } else {
        return const Right(<PostModel>[]);
      }
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, bool>> createComment(CommentModel post) async {
    try {
      final data = ParseObject('Comment')
        ..set('description', post.description)
        ..set('postId', post.postId)
        ..set('userId', post.userId);
      final response = await data.save();
      return Right(response.success);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, bool>> updateComment(CommentModel post) async {
    try {
      final data = ParseObject('Comment')
        ..objectId = post.id
        ..set('description', post.description);
      final response = await data.update();
      return Right(response.success);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, bool>> deleteComment(CommentModel post) async {
    try {
      final data = ParseObject('Comment')..objectId = post.id;
      final response = await data.delete();
      return Right(response.success);
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }

  Future<Either<Failure, List<CommentModel>>> readComments() async {
    try {
      final builder = QueryBuilder<ParseObject>(ParseObject('Comment'));
      builder.orderByAscending('createdAt');
      final response = await builder.query();
      if (response.success && response.results != null) {
        final list = response.results as List<ParseObject>;
        final result =
            list.map((comment) => CommentModel.fromMap(comment)).toList();
        return Right(result);
      } else {
        return const Right(<CommentModel>[]);
      }
    } on Exception catch (error) {
      return Left(ServerError(error.toString()));
    }
  }
}
