import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/core/widgets/appbars/simple_appbar.dart';
import 'package:forum_manha/modules/posts/controllers/posts_controller.dart';
import 'package:forum_manha/modules/posts/widgets/post_card.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends ModularState<PostsPage, PostsController> {
  @override
  void initState() {
    super.initState();
    controller.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Dúvidas'),
      floatingActionButton: FloatingActionButton(
        onPressed: _onCreatePost,
        child: const Icon(Icons.add),
      ),
      body: _buildPostList(),
    );
  }

  void _onCreatePost() {
    Modular.to.pushNamed('/home/posts/editor');
  }

  Widget _buildPostList() {
    return Observer(builder: (_) {
      return RefreshIndicator(
        onRefresh: controller.fetch,
        child: ListView.builder(
          padding: const EdgeInsets.all(20.0),
          itemCount: controller.length,
          itemBuilder: _buildPostCard,
        ),
      );
    });
  }

  Widget _buildPostCard(BuildContext context, int index) {
    final post = controller.postList[index];
    return PostCard(post: post);
  }
}
