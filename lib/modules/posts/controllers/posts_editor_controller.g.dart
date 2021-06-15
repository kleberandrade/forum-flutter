// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'posts_editor_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$PostsEditorController on _PostsEditorControllerBase, Store {
  final _$idAtom = Atom(name: '_PostsEditorControllerBase.id');

  @override
  String? get id {
    _$idAtom.reportRead();
    return super.id;
  }

  @override
  set id(String? value) {
    _$idAtom.reportWrite(value, super.id, () {
      super.id = value;
    });
  }

  final _$titleAtom = Atom(name: '_PostsEditorControllerBase.title');

  @override
  String get title {
    _$titleAtom.reportRead();
    return super.title;
  }

  @override
  set title(String value) {
    _$titleAtom.reportWrite(value, super.title, () {
      super.title = value;
    });
  }

  final _$descriptionAtom =
      Atom(name: '_PostsEditorControllerBase.description');

  @override
  String get description {
    _$descriptionAtom.reportRead();
    return super.description;
  }

  @override
  set description(String value) {
    _$descriptionAtom.reportWrite(value, super.description, () {
      super.description = value;
    });
  }

  final _$saveAsyncAction = AsyncAction('_PostsEditorControllerBase.save');

  @override
  Future<Either<Failure, bool>> save() {
    return _$saveAsyncAction.run(() => super.save());
  }

  final _$_PostsEditorControllerBaseActionController =
      ActionController(name: '_PostsEditorControllerBase');

  @override
  void setId(dynamic value) {
    final _$actionInfo = _$_PostsEditorControllerBaseActionController
        .startAction(name: '_PostsEditorControllerBase.setId');
    try {
      return super.setId(value);
    } finally {
      _$_PostsEditorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setTitle(dynamic value) {
    final _$actionInfo = _$_PostsEditorControllerBaseActionController
        .startAction(name: '_PostsEditorControllerBase.setTitle');
    try {
      return super.setTitle(value);
    } finally {
      _$_PostsEditorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  void setDescription(dynamic value) {
    final _$actionInfo = _$_PostsEditorControllerBaseActionController
        .startAction(name: '_PostsEditorControllerBase.setDescription');
    try {
      return super.setDescription(value);
    } finally {
      _$_PostsEditorControllerBaseActionController.endAction(_$actionInfo);
    }
  }

  @override
  String toString() {
    return '''
id: ${id},
title: ${title},
description: ${description}
    ''';
  }
}
