import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/modules/login/controllers/login_controller.dart';
import 'package:forum_manha/modules/login/repositories/login_repository.dart';

import 'pages/login_page.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => LoginRepository()),
    Bind((i) => LoginController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => LoginPage()),
  ];
}
