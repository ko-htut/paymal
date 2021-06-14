import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/page/single_top_up.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';
import 'multi_top_up.dart';

class TopUpPage extends StatefulWidget {
  TopUpPage({Key key}) : super(key: key);

  @override
  _TopUpPageState createState() => _TopUpPageState();
}

class _TopUpPageState extends State<TopUpPage> {
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  List<String> _phno = [];

  int _indexprice = 0;
  List<String> _price = [
    "1000 MMK",
    "3000 MMK",
    "5000 MMK",
    "10,000 MMK",
    "20,000 MMK",
    "30,000 MMK",
  ];
  int _indexopreator = 0;
  List<String> _opreator = [
    "assets/Mb/MPT.png",
    "assets/Mb/Telenor.png",
    "assets/Mb/Ooredoo.png",
    "assets/Mb/mytel.png",
    "assets/Mb/MECTEL.png",
  ];
  int _indexpayment = 0;
  List<String> _payment = [
    "assets/payment/AYAPay.png",
    "assets/payment/CBPay.png",
    "assets/payment/MPU.png",
    "assets/payment/Onepay.png",
  ];
  void _handleRadioValueChange(int value) {
    setState(() {
      _radioValue = value;

      switch (_radioValue) {
        case 0:
          _phno = [];
          break;
        case 1:
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(getTranslated(context, 'top_up')),
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            Row(
              children: [
                new Radio(
                  value: 0,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  getTranslated(context, "single_top_up"),
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  getTranslated(context, "multi_top_up"),
                  style: new TextStyle(fontSize: 16.0),
                ),
              ],
            ),

            _radioValue == 0 ? SingleTopUpPage() : MutliTopUpPage()
          ],
        ),
      ),
    );
  }

  InputDecoration _getInputDec(String hint, Icon icon) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(0),
      hintText: hint,
      prefixIcon: icon,
      fillColor: Colors.grey[200],
      filled: true,
      suffixIcon: Icon(Icons.contact_phone),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: Colors.white, width: 0),
        borderRadius: BorderRadius.all(Radius.circular(8)),
      ),
    );
  }
}
