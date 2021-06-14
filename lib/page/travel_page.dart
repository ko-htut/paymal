import 'package:flutter/material.dart';

class TravelPage extends StatefulWidget {
  TravelPage({Key key}) : super(key: key);

  @override
  _TravelPageState createState() => _TravelPageState();
}

class _TravelPageState extends State<TravelPage> {
  List<String> _travel = [
    "Air KBZ(Agent)",
    "Air KBZ(Bank Sale)",
    "BNF Express",
    "British Chamber",
    "Elite Express",
    "Flymya.com",
    "jj Express",
    "LODGGY",
    "MM Bus Ticket",
    "Myanmar ETC",
    "NguWar Bus TIcket"
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        title: Text("Travel"),
      ),
      body: Column(
        children: [],
      ),
    );
  }
}
