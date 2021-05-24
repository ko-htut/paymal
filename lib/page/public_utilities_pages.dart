import 'package:flutter/material.dart';

class PublicUtilitiesPage extends StatefulWidget {
  PublicUtilitiesPage({Key key}) : super(key: key);

  @override
  _PublicUtilitiesPageState createState() => _PublicUtilitiesPageState();
}

class _PublicUtilitiesPageState extends State<PublicUtilitiesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Public Utitilities"),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //
        ],
      )),
    );
  }
}
