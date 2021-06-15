import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/login_controller.dart';
import 'pages/login_page.dart';
import 'repositories/login_repository.dart';

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
