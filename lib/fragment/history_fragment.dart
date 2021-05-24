import 'package:flutter/material.dart';

class HistoryFragment extends StatefulWidget {
  HistoryFragment({Key key}) : super(key: key);

  @override
  _HistoryFragmentState createState() => _HistoryFragmentState();
}

class _HistoryFragmentState extends State<HistoryFragment> {
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
                  title: Text("bill"),
                  subtitle: Text("Hey bill bill bill bill")),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  title: Text("internet bill"),
                  subtitle: Text("Hey internet bill bill bill bill")),
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
                  title: Text("bill"),
                  subtitle: Text("Hey bill bill bill bill")),
            ),
            Card(
              elevation: 0.5,
              child: ListTile(
                  title: Text("internet bill"),
                  subtitle: Text("Hey internet bill bill bill bill")),
            ),
          ],
        ),
      ),
    );
  }
}
