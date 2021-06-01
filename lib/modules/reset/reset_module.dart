import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/modules/reset/pages/reset_page.dart';

import 'controllers/reset_controller.dart';
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
