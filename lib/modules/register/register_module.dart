import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/modules/register/pages/register_page.dart';

import 'controllers/register_controller.dart';

class RegisterModule extends Module {
  @override
  final List<Bind> binds = [
    //Bind((i) => RegisterRepository()),
    //Bind((i) => RegisterController(i())),
    Bind((i) => RegisterController()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => RegisterPage()),
  ];
}
