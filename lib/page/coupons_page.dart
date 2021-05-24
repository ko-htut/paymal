import 'package:flutter/material.dart';

class CouponsPage extends StatefulWidget {
  CouponsPage({Key key}) : super(key: key);

  @override
  _CouponsPageState createState() => _CouponsPageState();
}

class _CouponsPageState extends State<CouponsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Coupons"),),
    );
  }
}