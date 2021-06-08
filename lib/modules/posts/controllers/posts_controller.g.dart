// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsController on _PostsControllerBase, Store {
  Computed<int>? _$lengthComputed;

  @override
  int get length => (_$lengthComputed ??= Computed<int>(() => super.length,
          name: '_PostsControllerBase.length'))
      .value;

  final _$postListAtom = Atom(name: '_PostsControllerBase.postList');

  @override
  ObservableList<PostModel> get postList {
    _$postListAtom.reportRead();
    return super.postList;
  }

  @override
  set postList(ObservableList<PostModel> value) {
    _$postListAtom.reportWrite(value, super.postList, () {
      super.postList = value;
    });
  }

  final _$fetchAsyncAction = AsyncAction('_PostsControllerBase.fetch');

  @override
  Future<dynamic> fetch() {
    return _$fetchAsyncAction.run(() => super.fetch());
  }

  @override
  String toString() {
    return '''
postList: ${postList},
length: ${length}
    ''';
  }
}
