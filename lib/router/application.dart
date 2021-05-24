import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:paymal/utils/navigate_service.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Application {
  static GlobalKey<NavigatorState> key = GlobalKey();
  static FluroRouter router;
  static GetIt getIt = GetIt.instance;
  static SharedPreferences sp;
  static setupLocator() {
    getIt.registerSingleton(NavigateService());
  }

  static initSp() async {
    sp = await SharedPreferences.getInstance();
  }
}
