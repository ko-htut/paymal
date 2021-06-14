import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/page/multi_data_pack.dart';
import 'package:paymal/page/single_data_pack.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class DataPackagePage extends StatefulWidget {
  DataPackagePage({Key key}) : super(key: key);

  @override
  _DataPackagePageState createState() => _DataPackagePageState();
}

class _DataPackagePageState extends State<DataPackagePage> {
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  List<String> _phno = [];

  int _indexprice = 0;
  List<String> _price = ["MPT Night Time - 7 Nights 899Ks"];
  int _indexopreator = 0;
  List<String> _opreator = [
    "assets/Mb/MPT.png",
    "assets/Mb/Telenor.png",
    "assets/Mb/Ooredoo.png",
    "assets/Mb/mytel.png",
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
        title: Text(getTranslated(context, "data_package")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
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
                  getTranslated(context, "single_data_pack"),
                  style: new TextStyle(fontSize: 16.0),
                ),
                new Radio(
                  value: 1,
                  groupValue: _radioValue,
                  onChanged: _handleRadioValueChange,
                ),
                new Text(
                  getTranslated(context, "multi_data_pack"),
                  style: new TextStyle(fontSize: 16.0),
                ),
              ],
            ),
            _radioValue == 0 ? SingleDataPack() : MultiDataPack()
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

// if (index == 0) {
//                         _price.add("MPT Night Time - 7 Nights 899Ks");
//                       } else if (index == 1) {
//                         _price.add("Telenor Data Suboo 700 MB 799Ks");
//                       } else if (index == 2) {
//                         _price.add("Ooredoo Datapack 1GB 999Ks");
//                       } else {
//                         _price.add("MyTel MyTel Datapack 500MB 375 Ks");
//                       }
