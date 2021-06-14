import 'package:flutter/material.dart';
import 'package:paymal/utils/navigator_util.dart';

import '../language_constants.dart';

class BillPaymentDetails extends StatefulWidget {
  final String title;
  final List<String> data;
  final IconData iconData;
  BillPaymentDetails(
      {Key key,
      @required this.title,
      @required this.data,
      @required this.iconData})
      : super(key: key);

  @override
  _BillPaymentDetailsState createState() => _BillPaymentDetailsState();
}

class _BillPaymentDetailsState extends State<BillPaymentDetails> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(widget.title),
      ),
      body: SingleChildScrollView(
        child: Column(
          
          children: widget.data
              .map((e) => InkWell(
                    onTap: () {
                      e == "British Council"
                          ? NavigatorUtil.goEduDetails(context)
                          : null;
                      print(e);
                    },
                    child: Card(
                      child: ListTile(
                        leading: Icon(widget.iconData),
                        title: Text(e),
                      ),
                    ),
                  ))
              .toList(),
        ),
      ),
    );
  }
}
