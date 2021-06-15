// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_detail_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsDetailController on _PostsDetailControllerBase, Store {
  final _$commentsListAtom =
      Atom(name: '_PostsDetailControllerBase.commentsList');

  @override
  ObservableList<CommentModel> get commentsList {
    _$commentsListAtom.reportRead();
    return super.commentsList;
  }

  @override
  set commentsList(ObservableList<CommentModel> value) {
    _$commentsListAtom.reportWrite(value, super.commentsList, () {
      super.commentsList = value;
    });
  }

  final _$commentAtom = Atom(name: '_PostsDetailControllerBase.comment');

  @override
  String get comment {
    _$commentAtom.reportRead();
    return super.comment;
  }

  @override
  set comment(String value) {
    _$commentAtom.reportWrite(value, super.comment, () {
      super.comment = value;
    });
  }

  final _$postAtom = Atom(name: '_PostsDetailControllerBase.post');

  @override
  PostModel? get post {
    _$postAtom.reportRead();
    return super.post;
  }

  @override
  set post(PostModel? value) {
    _$postAtom.reportWrite(value, super.post, () {
      super.post = value;
    });
  }

  final _$createCommentAsyncAction =
      AsyncAction('_PostsDetailControllerBase.createComment');

  @override
  Future<dynamic> createComment() {
    return _$createCommentAsyncAction.run(() => super.createComment());
  }

  final _$incrementViewsAsyncAction =
      AsyncAction('_PostsDetailControllerBase.incrementViews');

  @override
  Future<dynamic> incrementViews() {
    return _$incrementViewsAsyncAction.run(() => super.incrementViews());
  }

  final _$fetchCommentsByPostIdAsyncAction =
      AsyncAction('_PostsDetailControllerBase.fetchCommentsByPostId');

  @override
  Future<dynamic> fetchCommentsByPostId() {
    return _$fetchCommentsByPostIdAsyncAction
        .run(() => super.fetchCommentsByPostId());
  }

  final _$_PostsDetailControllerBaseActionController =
      ActionController(name: '_PostsDetailControllerBase');

  @override
  void setComment(dynamic value) {
    final _$actionInfo = _$_PostsDetailControllerBaseActionController
        .startAction(name: '_PostsDetailControllerBase.setComment');
    try {
      return super.setComment(value);
    } finally {
      _$_PostsDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setPost(dynamic value) {
    final _$actionInfo = _$_PostsDetailControllerBaseActionController
        .startAction(name: '_PostsDetailControllerBase.setPost');
    try {
      return super.setPost(value);
    } finally {
      _$_PostsDetailControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
commentsList: ${commentsList},
comment: ${comment},
post: ${post}
    ''';
  }
}
