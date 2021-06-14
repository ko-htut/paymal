import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

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
  int _indexcard = 0;
  int _indexpayment = 0;
  List<String> _payment = [
    "assets/payment/AYAPay.png",
    "assets/payment/CBPay.png",
    "assets/payment/MPU.png",
    "assets/payment/Onepay.png",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        title: Text(widget.cardname),
      ),
      body: SingleChildScrollView(
          child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Card(
            elevation: 0.4,
            child: Container(
              width:
                  MediaQuery.of(context).size.width - ScreenUtil().setWidth(30),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Stack(
                  children: [
                    Image.asset(
                      widget.cardimage,
                      fit: BoxFit.cover,
                      filterQuality: FilterQuality.medium,
                    ),
                    Positioned(
                        left: 5,
                        bottom: 5,
                        child: Text(
                          widget.items[_indexcard],
                          style: Theme.of(context).textTheme.caption,
                        ))
                  ],
                ),
              ),
            ),
          ),
          //
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  PayMal.gift_card_light,
                  color: Colors.green,
                ),
                HEmptyView(10),
                Text(
                  getTranslated(context, "choose_card_type"),
                  style: TextStyle(color: Colors.green),
                ),
              ],
            ),
          ),
          Column(
              crossAxisAlignment: CrossAxisAlignment.start,
            children: widget.items.map((e) {
              var index = widget.items.indexOf(e);
              return GestureDetector(
                onTap: () {
                  setState(() {
                    _indexcard = index;
                  });
                },
                child: Container(
                  width: double.infinity,
                  padding: EdgeInsets.all(15),
                  margin: EdgeInsets.all(5),
                  decoration: BoxDecoration(
                      color:
                          index == _indexcard ? Colors.blue[100] : Colors.white,
                      borderRadius: BorderRadius.circular(5)),
                  child: SizedBox(
                    width: 100,
                    height: 20,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Icon(AntIcons.gift),
                        Container(
                          width: 10,
                        ),
                        Marquee(child: Text(e)),
                      ],
                    ),
                  ),
                ),
              );
            }).toList(),
          ),
          Container(
            margin: EdgeInsets.all(5),
            child: Row(
              children: [
                Icon(
                  Icons.payment,
                  color: Colors.blue,
                ),
                HEmptyView(10),
                Text(
                 getTranslated(context, "payment_type"),
                  style: TextStyle(color: Colors.blue),
                ),
              ],
            ),
          ),
          Container(
            padding: EdgeInsets.all(5),
            child: Wrap(
                children: _payment.map((e) {
              var index = _payment.indexOf(e);
              return InkWell(
                onTap: () {
                  setState(() {
                    _indexpayment = index;
                  });
                },
                child: Container(
                  padding: const EdgeInsets.all(5.0),
                  margin: const EdgeInsets.all(3.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(5),
                    color: index == _indexpayment
                        ? Colors.blue[100]
                        : Colors.white,
                  ),
                  child: Image.asset(
                    e,
                    height: 55,
                    width: 55,
                  ),
                ),
              );
            }).toList()),
          ),

          Padding(
            padding: const EdgeInsets.all(8.0),
            child: RaisedButton(
              color: Colors.blueAccent,
              onPressed: () {
                //
              },
              child: Container(
                height: 55,
                width: double.infinity,
                child: Center(
                  child: Text(
                    "ဝယ်မည်",
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ),
          )
        ],
      )),
    );
  }
}
