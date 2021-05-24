import 'package:flutter/material.dart';

class Loyanty extends StatefulWidget {
  Loyanty({Key key}) : super(key: key);

  @override
  _LoyantyState createState() => _LoyantyState();
}

class _LoyantyState extends State<Loyanty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
       appBar: AppBar(title: Text("Loyalty Point"),),
    );
  }
}