import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/posts_controller.dart';
import 'controllers/posts_editor_controller.dart';
import 'pages/posts_editor_page.dart';
import 'pages/posts_page.dart';
import 'repositories/posts_repository.dart';

class PostsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => PostsRepository()),
    Bind((i) => PostsController(i())),
    Bind((i) => PostsEditorController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => PostsPage()),
    ChildRoute('/editor', child: (_, __) => PostsEditorPage()),
  ];
}
