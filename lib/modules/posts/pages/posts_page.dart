import 'package:flutter/material.dart';
import 'package:forum_manha/core/widgets/appbars/simple_appbar.dart';

class PostsPage extends StatefulWidget {
  @override
  _PostsPageState createState() => _PostsPageState();
}

class _PostsPageState extends State<PostsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const SimpleAppBar(title: 'Dúvidas'),
      body: Container(),
    );
  }
}
