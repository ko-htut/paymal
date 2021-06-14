import 'package:flutter/material.dart';
import 'package:paymal/router/application.dart';
import 'package:paymal/utils/navigator_util.dart';

class SplashPage extends StatefulWidget {
  SplashPage({Key key}) : super(key: key);

  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    super.initState();
    goPage();
  }

  void goPage() async {
    Application.initSp();
    Future.delayed(Duration(seconds: 3))
        .then((value) => NavigatorUtil.goAdSplashPage(context));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.max,
        children: [
          Center(child: Image.asset("assets/logo/sp logo.png")),
        ],
      ),
    );
  }
}
