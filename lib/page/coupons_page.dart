import 'package:flutter/material.dart';

import '../language_constants.dart';

class CouponsPage extends StatefulWidget {
  CouponsPage({Key key}) : super(key: key);

  @override
  _CouponsPageState createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
          title: Text(getTranslated(context, 'coupons')),
        ),
        body: Center(
          child: Text(
            getTranslated(context, "coming_soon"),
            style: Theme.of(context).textTheme.headline6,
          ),
        ));
  }
}
