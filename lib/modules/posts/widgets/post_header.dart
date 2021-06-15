import 'package:flutter/material.dart';
import 'package:forum_manha/core/helpers/date_helper.dart';
import 'package:forum_manha/core/helpers/string_helper.dart';
import 'package:forum_manha/core/widgets/images/circle_avatar_network.dart';
import 'package:forum_manha/modules/posts/models/post_model.dart';

class PostHeader extends StatelessWidget {
  final PostModel post;
  final Function()? onPressed;

  const PostHeader({
    Key? key,
    required this.post,
    this.onPressed,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.only(bottom: 20),
      child: Row(
        children: [
          CircleAvatarNetwork(
            imageUrl: post.avatar ?? '',
            initials: StringHelper.getInitials(post.name ?? ''),
            radius: 24,
          ),
          const SizedBox(width: 20),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text(post.name ?? ''),
                const SizedBox(height: 4),
                Text(DateHelper.format(post.date!)),
              ],
            ),
          ),
          onPressed != null
              ? IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    Icons.favorite_outline,
                    size: 32,
                  ),
                )
              : const SizedBox(),
        ],
      ),
    );
  }
}
