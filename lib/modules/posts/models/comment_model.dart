import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class CommentModel extends Equatable {
  String? id;
  String description;
  String userId;
  String postId;
  DateTime? date;

  CommentModel({
    this.id,
    required this.description,
    required this.userId,
    required this.postId,
    this.date,
  });

  factory CommentModel.fromMap(ParseObject map) {
    final user = map.get<ParseUser>('userId')!;
    final post = map.get<ParseObject>('postId')!;
    return CommentModel(
      id: map.objectId!,
      date: map.createdAt,
      description: map.get('description'),
      userId: user.objectId!,
      postId: post.objectId!,
    );
  }

  @override
  List<Object?> get props => [id, description, userId, date];
}
