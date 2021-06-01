import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:forum_manha/core/configs/app_api.dart';
import 'package:parse_server_sdk_flutter/parse_server_sdk.dart';
import 'package:url_strategy/url_strategy.dart';

import 'app_module.dart';
import 'app_widget.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  setPathUrlStrategy();

  await Parse().initialize(
    AppApi.appId,
    AppApi.serverUrl,
    clientKey: AppApi.clientKey,
    autoSendSessionId: true,
    debug: true,
  );

  runApp(
    ModularApp(module: AppModule(), child: AppWidget()),
  );
}
