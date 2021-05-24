import 'package:flutter/material.dart';

class TicketPage extends StatefulWidget {
  TicketPage({Key key}) : super(key: key);

  @override
  _TicketPageState createState() => _TicketPageState();
}

class _TicketPageState extends State<TicketPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Ticket Page"),
      ),
    );
  }
}