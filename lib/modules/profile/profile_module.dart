import 'package:flutter_modular/flutter_modular.dart';

import 'controllers/profile_controller.dart';
import 'pages/profile_page.dart';
import 'repositories/profile_repository.dart';

class ProfileModule extends Module {
  @override
  final List<Bind> binds = [
    Bind((i) => ProfileRepository()),
    Bind((i) => ProfileController(i())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, __) => ProfilePage()),
  ];
}
