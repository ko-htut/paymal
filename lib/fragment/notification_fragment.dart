import 'dart:ui';

import 'package:flutter/material.dart';

class NotificationFragment extends StatefulWidget {
  NotificationFragment({Key key}) : super(key: key);

  @override
  _NotificationFragmentState createState() => _NotificationFragmentState();
}

class _NotificationFragmentState extends State<NotificationFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Today",
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              height: 10,
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  title: Text("Notification"),
                  subtitle: Text("hey you will find ... ...  ... ...")),
            ),
            Text(
              "Yesterday",
              style: Theme.of(context).textTheme.headline6,
            ),
            Container(
              height: 10,
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  title: Text("Notification"),
                  subtitle: Text("hey you will find ... ...  ... ...")),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  title: Text("Notification"),
                  subtitle: Text("hey you will find ... ...  ... ...")),
            )
          ],
        ),
      ),
    );
  }
}
