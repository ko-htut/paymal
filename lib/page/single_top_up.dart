import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class SingleTopUpPage extends StatefulWidget {
  SingleTopUpPage({Key key}) : super(key: key);

  @override
  _SingleTopUpPageState createState() => _SingleTopUpPageState();
}

class _SingleTopUpPageState extends State<SingleTopUpPage> {
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
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Row(
                children: [
               
                  Expanded(
                                      child: TextField(
                      textInputAction: TextInputAction.done,
                      controller: _phoneController,
                      keyboardType: TextInputType.text,
                      decoration:
                          _getInputDec("phone number", Icon(PayMal.topup)),
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
                        _phoneController.clear();
                      },
                    ),
                  ),
                ],
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
                              color: index == _price
                                  ? Colors.blue[100]
                                  : Colors.white,
                              borderRadius: BorderRadius.circular(5)),
                          padding: EdgeInsets.all(3),
                          // margin: EdgeInsets.all(5),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Row(
                                children: [
                                  HEmptyView(5),
                                  Text(
                                    e +
                                        " " +
                                        getTranslated(
                                            context, "top_up_bill_to"),
                                    style: TextStyle(
                                        color: Colors.blue,
                                        fontSize: 18,
                                        fontWeight: FontWeight.normal),
                                  ),
                                ],
                              ),
                              Row(
                                children: [
                                  Image.asset(
                                    (_opreator.toList()..shuffle()).first,
                                    height: 45,
                                    width: 45,
                                  )
                                ],
                              )
                            ],
                          ),
                        );
                      }).toList(),
                    )
                  : Container(),
              Text(getTranslated(context, "amount"),
                  style: Theme.of(context).textTheme.headline6),
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
                      margin: EdgeInsets.only(top: 5),
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
                        getTranslated(context, "topup"),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ),
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
      suffixIcon: Icon(Icons.contact_phone),
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
