import 'package:flutter/material.dart';
import 'package:paymal/fragment/account_fragment.dart';
import 'package:paymal/fragment/history_fragment.dart';
import 'package:paymal/fragment/main_fragment.dart';
import 'package:paymal/fragment/notification_fragment.dart';
import 'package:paymal/language_constants.dart';

class HomePage extends StatefulWidget {
  HomePage({Key key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _cIndex = 0;

  void _incrementTab(index) {
    setState(() {
      _cIndex = index;
    });
  }

  List<Widget> _page = [
    MainFragment(),
    HistoryFragment(),
    NotificationFragment(),
    AccountFragment(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: Text(
          'Paymal',
          style: TextStyle(color: Colors.black),
        ),
      ),
      body: _page[_cIndex],
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _cIndex,
        type: BottomNavigationBarType.fixed,
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: getTranslated(context, 'home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: getTranslated(context, 'history'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.notifications),
            label: getTranslated(context, 'notification'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.account_circle_outlined),
            label: getTranslated(context, 'account'),
          ),
        ],
        onTap: (index) {
          _incrementTab(index);
        },
      ),
    );
  }
}
