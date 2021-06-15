import 'package:equatable/equatable.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';

class PostModel extends Equatable {
  String? id;
  String title;
  String description;
  String userId;
  DateTime? date;
  int? viewsAmount;
  int? votesAmount;
  int? commentsAmount;

  String? name;
  String? avatar;

  PostModel({
    this.id,
    required this.title,
    required this.description,
    required this.userId,
    this.date,
    this.viewsAmount,
    this.votesAmount,
    this.commentsAmount,
    this.avatar,
    this.name,
  });

  factory PostModel.fromMap(ParseObject map) {
    final user = map.get<ParseUser>('userId')!;
    return PostModel(
      id: map.objectId!,
      date: map.createdAt,
      title: map.get('title'),
      description: map.get('description'),
      viewsAmount: map.get('views'),
      userId: user.objectId!,
    );
  }

  @override
  List<Object?> get props =>
      [id, date, title, description, viewsAmount, userId];
}
