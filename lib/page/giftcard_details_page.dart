import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class GiftCardDetailsPage extends StatefulWidget {
  final String cardname;
  final String cardimage;
  final List<String> items;
  GiftCardDetailsPage(
      {Key key,
      @required this.cardname,
      @required this.cardimage,
      @required this.items})
      : super(key: key);

  @override
  _GiftCardDetailsPageState createState() => _GiftCardDetailsPageState();
}

class _GiftCardDetailsPageState extends State<GiftCardDetailsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.cardname),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          Card(
            elevation: 0.4,
            child: Container(
              width:
                  MediaQuery.of(context).size.width - ScreenUtil().setWidth(30),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Image.asset(
                  widget.cardimage,
                  fit: BoxFit.fill,
                ),
              ),
            ),
          ),
          //
          Column(
            children: widget.items
                .map((e) => ListTile(
                  leading: Icon(Icons.money_off),
                      title: Text(e),
                    ))
                .toList(),
          )
        ],
      )),
    );
  }
}
