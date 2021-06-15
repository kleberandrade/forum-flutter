import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'core/configs/app_theme.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: kAppTheme,
      initialRoute: '/login',
    ).modular();
  }
}
