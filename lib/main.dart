import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:paymal/app_widget.dart';
import 'package:paymal/router/application.dart';
import 'package:paymal/router/routes.dart';

void main() {
  runApp(MyApp());
  //Route
  final router = FluroRouter();
  Routes.configureRoutes(router);
  Application.router = router;
  Application.setupLocator();
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return AppWidget();
  }
}
