import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CurrentUserModel extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String avatar;

  CurrentUserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.avatar,
  });

  factory CurrentUserModel.fromMap(ParseUser map) {
    return CurrentUserModel(
      uid: map.objectId!,
      name: map.get('name'),
      email: map.get('email'),
      avatar: map.get('avatar'),
    );
  }

  @override
  List<Object?> get props => [uid, name, email, avatar];
}
