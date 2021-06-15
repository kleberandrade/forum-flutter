import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/core/configs/app_colors.dart';
import 'package:forum_manha/core/configs/app_text_styles.dart';
import 'package:forum_manha/core/widgets/appbars/simple_appbar.dart';
import 'package:forum_manha/modules/posts/controllers/posts_detail_controller.dart';
import 'package:forum_manha/modules/posts/models/post_model.dart';
import 'package:forum_manha/modules/posts/widgets/post_header.dart';

class PostsDetailPage extends StatefulWidget {
  final PostModel post;

  const PostsDetailPage({
    Key? key,
    required this.post,
  }) : super(key: key);

  @override
  _PostsDetailPageState createState() => _PostsDetailPageState();
}

class _PostsDetailPageState
    extends ModularState<PostsDetailPage, PostsDetailController> {
  @override
  void initState() {
    super.initState();
    controller.setPost(widget.post);
    controller.incrementViews();
    controller.fetchCommentsByPostId();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Comentários'),
      body: Column(
        children: [
          _buildPost(),
          //Expanded(child: _buildComments()),
          _buildInput(),
        ],
      ),
    );
  }

  Widget _buildPost() {
    return Container(
      color: AppColors.black.withOpacity(0.05),
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          PostHeader(post: widget.post),
          Text(widget.post.title, style: AppTextStyles.titleBlack),
          const SizedBox(height: 10),
          Text(widget.post.description, style: AppTextStyles.subtitleBlack),
        ],
      ),
    );
  }

  Widget _buildComments() {
    return ListView.builder(
      itemCount: controller.commentsList.length,
      itemBuilder: _commentCardBuild,
    );
  }

  Widget _commentCardBuild(BuildContext context, int index) {
    return Container();
  }

  Widget _buildInput() {
    return Container(
      padding: const EdgeInsets.only(left: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.end,
        children: [
          Observer(builder: (_) {
            return Expanded(
              child: TextFormField(
                decoration: const InputDecoration(
                  border: InputBorder.none,
                  hintText: 'Digite seu comentário...',
                ),
                maxLines: null,
                initialValue: controller.comment,
                onChanged: controller.setComment,
              ),
            );
          }),
          IconButton(
            onPressed: controller.createComment,
            icon: const Icon(Icons.send),
          )
        ],
      ),
    );
  }
}
