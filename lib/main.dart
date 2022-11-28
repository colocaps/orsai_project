import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sign_in/sign_in.dart';

import 'application/application.dart';
import 'ioc_manager.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitDown,
    DeviceOrientation.portraitUp,
  ]);
  await _registerDependencies();

  runApp(const Application());
}

Future<void> _registerDependencies() async {
  IoCManager.registerDependencies();
  await SignInInitializer.registerDependencies();
}
