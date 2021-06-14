import 'package:flutter/material.dart';
import 'package:paymal/pay_mal_icons.dart';

import '../language_constants.dart';

class TicketPage extends StatefulWidget {
  TicketPage({Key key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  List<String> _ticket = [
    "Air KBZ (Agent)",
    "Air KBZ (Bank Sale)",
    "BNF Express",
    "British Chamber",
    "Elite Express",
    "Elite Express",
    "Flymya.com",
    "JJ Express",
    "LODGGY",
    "MM Bus Ticket",
    "Myanmar ETC",
    "NguWar Bus Ticket",
    'Oway'
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        title: Text(getTranslated(context, 'tickets')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: _ticket
                  .map((e) => Card(
                        child: ListTile(
                          leading: Icon(PayMal.ticket),
                          title: Text(e),
                        ),
                      ))
                  .toList(),
            ),
          ],
        ),
      ),
    );
  }
}
