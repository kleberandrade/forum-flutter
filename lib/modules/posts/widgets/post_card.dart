import 'package:flutter/material.dart';
import 'package:forum_manha/modules/posts/widgets/post_header.dart';
import '../models/post_model.dart';

class PostCard extends StatelessWidget {
  final PostModel post;
  final Function(PostModel) onPressed;

  const PostCard({
    Key? key,
    required this.post,
    required this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => onPressed(post),
      child: Card(
        child: Container(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              PostHeader(post: post),
              Text(post.title),
              Container(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Text(post.description),
              ),
              const Divider(height: 0.0),
              Container(
                padding: const EdgeInsets.only(top: 20.0),
                child: Row(
                  children: [
                    _buildLikes(),
                    _buildComments(),
                    _buildViews(),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildViews() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text('${post.viewsAmount ?? 0}'),
          const SizedBox(width: 10.0),
          const Icon(Icons.visibility_outlined),
        ],
      ),
    );
  }

  Widget _buildComments() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text('${post.commentsAmount ?? 0}'),
          const SizedBox(width: 10.0),
          const Icon(Icons.comment_outlined),
        ],
      ),
    );
  }

  Widget _buildLikes() {
    return Expanded(
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Text('${post.votesAmount ?? 0}'),
          const SizedBox(width: 10.0),
          const Icon(Icons.favorite_outline),
        ],
      ),
    );
  }
}
