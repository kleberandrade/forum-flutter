import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class UserModel extends Equatable {
  final String uid;
  final String name;
  final String email;
  final String avatar;
  final String token;

  UserModel({
    required this.uid,
    required this.name,
    required this.email,
    required this.avatar,
    required this.token,
  });

  factory UserModel.fromMap(ParseUser map) {
    return UserModel(
      uid: map.objectId!,
      name: map.get('name'),
      email: map.get('email'),
      avatar: map.get('avatar'),
      token: map.get('sessionToken'),
    );
  }

  @override
  List<Object?> get props => [uid, name, email, avatar, token];
}
