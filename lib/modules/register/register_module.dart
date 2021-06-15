import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/register_controller.dart';
import 'pages/register_page.dart';
import 'repositories/register_repository.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => RegisterRepository()),
    Bind((i) => RegisterController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => RegisterPage()),
  ];
}
