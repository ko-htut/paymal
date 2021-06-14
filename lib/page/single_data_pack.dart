import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class SingleDataPack extends StatefulWidget {
  SingleDataPack({Key key}) : super(key: key);

  @override
  _SingleDataPackState createState() => _SingleDataPackState();
}

class _SingleDataPackState extends State<SingleDataPack> {
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

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
                 TextField(
                textInputAction: TextInputAction.done,
                controller: _phoneController,
                keyboardType: TextInputType.text,
                decoration: _getInputDec("", Icon(AntIcons.phone)),
                onSubmitted: (v) {
                  if (_phoneController.text != "") {
                    if (_radioValue == 1) {
                      setState(() {
                        _phno.add(v);
                        print(v);
                      });
                      _phoneController.clear();
                    } else {
                      setState(() {
                        _phno.clear();
                      });
                      if (_phno.length < 1) {
                        setState(() {
                          _phno.add(v);
                        });
                      }
                    }
                  }
                },
              ),
              VEmptyView(15),
              (_phno.length > 0)
                  ? Column(
                      children: _phno.map((e) {
                        var index = _phno.indexOf(e);
                        return Container(
                          width: double.infinity,
                          decoration: BoxDecoration(
                              border: Border.all(
                                  width: 1, color: Colors.blueAccent),
                              // color: Colors.blue[100],
                              // ignore: unrelated_type_equality_checks
                              color: index == _price
                                  ? Colors.blue[100]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(10),
                          margin: EdgeInsets.all(5),
                          child: Text(
                            e + getTranslated(context, "Top up data to"),
                            style: TextStyle(
                                color: Colors.blue,
                                fontWeight: FontWeight.normal),
                          ),
                        );
                      }).toList(),
                    )
                  : Container(),

              Divider(),
              _price.length < 0
                  ? Text(getTranslated(context, "amount"),
                      style: Theme.of(context).textTheme.headline6)
                  : Container(),
              Column(
                children: _price.map((e) {
                  var index = _price.indexOf(e);
                  return InkWell(
                    onTap: () {
                      setState(() {
                        print("index is $index");
                        _indexprice = index;
                      });
                    },
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          border:
                              Border.all(width: 1, color: Colors.blueAccent),
                          color: index == _indexprice
                              ? Colors.blue[100]
                              : Colors.white,
                          borderRadius: BorderRadius.circular(5)),
                      padding: EdgeInsets.all(8),
                      margin: EdgeInsets.all(5),
                      child: Text(e, style: Theme.of(context).textTheme.button),
                    ),
                  );
                }).toList(),
              ),

              Divider(),
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
              Divider(),
              Padding(
                padding: const EdgeInsets.only(top: 10.0),
                child: RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    //
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    child: Center(
                      child: Text(
                        getTranslated(context, "purchase_data_packs"),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
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
