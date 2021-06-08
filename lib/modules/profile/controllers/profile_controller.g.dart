// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'profile_controller.dart';

// **************************************************************************
// StoreGenerator
// **************************************************************************

// ignore_for_file: non_constant_identifier_names, unnecessary_brace_in_string_interps, unnecessary_lambdas, prefer_expression_function_bodies, lines_longer_than_80_chars, avoid_as, avoid_annotating_with_dynamic

mixin _$ProfileController on _ProfileControllerBase, Store {
  final _$nameAtom = Atom(name: '_ProfileControllerBase.name');

  @override
  String get name {
    _$nameAtom.reportRead();
    return super.name;
  }

  @override
  set name(String value) {
    _$nameAtom.reportWrite(value, super.name, () {
      super.name = value;
    });
  }

  final _$emailAtom = Atom(name: '_ProfileControllerBase.email');

  @override
  String get email {
    _$emailAtom.reportRead();
    return super.email;
  }

  @override
  set email(String value) {
    _$emailAtom.reportWrite(value, super.email, () {
      super.email = value;
    });
  }

  final _$pictureUrlAtom = Atom(name: '_ProfileControllerBase.pictureUrl');

  @override
  String get pictureUrl {
    _$pictureUrlAtom.reportRead();
    return super.pictureUrl;
  }

  @override
  set pictureUrl(String value) {
    _$pictureUrlAtom.reportWrite(value, super.pictureUrl, () {
      super.pictureUrl = value;
    });
  }

  final _$logoutAsyncAction = AsyncAction('_ProfileControllerBase.logout');

  @override
  Future<dynamic> logout() {
    return _$logoutAsyncAction.run(() => super.logout());
  }

  @override
  String toString() {
    return '''
name: ${name},
email: ${email},
pictureUrl: ${pictureUrl}
    ''';
  }
}
