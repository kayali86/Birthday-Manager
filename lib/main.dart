import 'package:birthday_manager/presentation/router.dart';
import 'app_config.dart';
import 'presentation/router.dart';
import 'package:flutter/material.dart';
import 'app/my_app.dart';

void main() {
  MyApp.initSystemDefault();

  runApp(
    AppConfig(
      appName: "BirthdayManager",
      debugTag: false,
      flavorName: "prod",
      initialRoute: AppRouter.LOGIN,
      child: MyApp.runWidget(),
    ),
  );
}
