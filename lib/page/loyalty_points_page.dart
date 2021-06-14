import 'package:flutter/material.dart';
import 'package:paymal/language_constants.dart';

class Loyanty extends StatefulWidget {
  Loyanty({Key key}) : super(key: key);

  @override
  _LoyantyState createState() => _LoyantyState();
}

class _LoyantyState extends State<Loyanty> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.blueAccent,
          title: Text(getTranslated(context, "loyalty")),
        ),
        body: Center(
          child: Text(getTranslated(context, "coming_soon"),style: Theme.of(context).textTheme.headline6,),
        ));
  }
}
