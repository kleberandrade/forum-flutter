import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/reset_controller.dart';
import 'pages/reset_page.dart';
import 'repositories/reset_repository.dart';

class ResetModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ResetRepository()),
    Bind((i) => ResetController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ResetPage()),
  ];
}
