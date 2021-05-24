import 'package:flutter/material.dart';

class DataPackagePage extends StatefulWidget {
  DataPackagePage({Key key}) : super(key: key);

  @override
  _DataPackagePageState createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
  appBar: AppBar(title: Text("Data Package"),),
    );
  }
}