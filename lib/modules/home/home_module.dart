import 'package:flutter_modular/flutter_modular.dart';

import '../posts/posts_module.dart';
import '../profile/profile_module.dart';
import 'controllers/home_controller.dart';
import 'pages/home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => HomeController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(
      '/',
      child: (_, __) => HomePage(),
      children: [
        ModuleRoute('/posts', module: PostsModule()),
        ModuleRoute('/profile', module: ProfileModule()),
      ],
    ),
  ];
}
