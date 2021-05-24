import 'package:flutter/material.dart';

class TQPage extends StatefulWidget {
  TQPage({Key key}) : super(key: key);

  @override
  _TQPageState createState() => _TQPageState();
}

class _TQPageState extends State<TQPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
    appBar: AppBar(title: Text("TQ"),),
    );
  }
}