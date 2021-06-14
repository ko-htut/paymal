import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/model/bill_model.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';
import '../pay_mal_icons.dart';

class MutliTopUpPage extends StatefulWidget {
  MutliTopUpPage({Key key}) : super(key: key);

  @override
  _MutliTopUpPageState createState() => _MutliTopUpPageState();
}

class _MutliTopUpPageState extends State<MutliTopUpPage> {
  final TextEditingController _phoneController = TextEditingController();
  TextEditingController nameController = TextEditingController();
  int _radioValue = 0;

  int _indexprice = 0;
  List<String> _price = [
    "1000 ",
    "3000 ",
    "5000 ",
    "10000 ",
    "20000 ",
    "30000 ",
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

  List<Datalist> mypkaglist = [];
  String _optimag = '';
  String _phno = '';
  bool _isOpt = false;
  bool _isAnoumt = false;
  @override
  Widget build(BuildContext context) {
    return Expanded(
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
                      _getInputDec("Phone number", Icon(PayMal.topup)),
                  onSubmitted: (v) {
                    if (_phoneController.text != "") {
                      if (_radioValue == 1) {
                        setState(() {
                          _phno = v;
                          print(v);
                        });
                        _phoneController.clear();
                      } else {
                        setState(() {
                          _phno = "";
                        });
                        if (_phno.length < 1) {
                          setState(() {
                            _phno = v;
                          });
                        }
                      }
                    }

                    setState(() {
                      _optimag = (_opreator.toList()..shuffle()).first;
                      _isOpt = true;
                    });
                  },
                ),
              ),
              Container(
                  width: 45,
                  child: InkWell(
                      onTap: () {
                        // _phoneController.clear();
                        setState(() {
                          // _isOpt = false;
                          _isAnoumt = true;
                        });
                      },
                      child: Icon(Icons.add)))
            ],
          ),
          VEmptyView(10),
          _isAnoumt
              ? Container(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                  border: Border.all(
                                      width: 1, color: Colors.blueAccent),
                                  color: index == _indexprice
                                      ? Colors.blue[100]
                                      : Colors.white,
                                  borderRadius: BorderRadius.circular(5)),
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.only(top: 5),
                              child: Text(e + " MMK",
                                  style: Theme.of(context).textTheme.button),
                            ),
                          );
                        }).toList(),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 10.0),
                        child: RaisedButton(
                          color: Colors.blueAccent,
                          onPressed: () {
                            //
                            print(mypkaglist.length);
                            setState(() {
                              _phoneController.clear();
                              _isOpt = false;
                              _isAnoumt = false;
                              mypkaglist.add(Datalist(
                                  imageUrl: _optimag,
                                  phono: _phno,
                                  pak: _price[_indexprice]));
                            });
                            print(mypkaglist.length);
                          },
                          child: Container(
                            height: 40,
                            width: double.infinity,
                            child: Center(
                              child: Text(
                                getTranslated(context, "comfirm"),
                                style: TextStyle(color: Colors.white),
                              ),
                            ),
                          ),
                        ),
                      ),
                      Divider(),
                    ],
                  ),
                )
              : Container(),
          Divider(),
          mypkaglist.length > 0
              ? Card(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text("Payment Details"),
                      ),
                      // Divider(),
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8),
                        child: Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.blueAccent[400],
                                  borderRadius: BorderRadius.circular(5)),
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Phone Nunber",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "Price",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                            Column(
                              children: mypkaglist
                                  .map(
                                    (e) => Container(
                                      decoration: BoxDecoration(
                                          color: Colors.blue[200],
                                          borderRadius:
                                              BorderRadius.circular(5)),
                                      width: double.infinity,
                                      padding: EdgeInsets.all(8),
                                      margin: EdgeInsets.all(2),
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(e.phono),
                                              Text(e.pak + " MMK"),
                                              InkWell(
                                                onTap: () {
                                                  var index =
                                                      mypkaglist.indexOf(e);
                                                  setState(() {
                                                    mypkaglist.removeAt(index);
                                                  });
                                                },
                                                child: Icon(
                                                  Icons.delete,
                                                  color: Colors.white,
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
                                  )
                                  .toList(),
                            ),
                            Container(
                              decoration: BoxDecoration(
                                  color: Colors.red[400],
                                  borderRadius: BorderRadius.circular(5)),
                              width: double.infinity,
                              padding: EdgeInsets.all(8),
                              margin: EdgeInsets.all(2),
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text(
                                        "Amount",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Text(
                                        "${mypkaglist.map<int>((m) => int.parse(m.pak)).reduce((a, b) => a + b)} MMK",
                                        style: TextStyle(
                                          color: Colors.white,
                                        ),
                                      ),
                                      Container()
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
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
                      ),
                    ],
                  ),
                )
              : Container(
                  margin: EdgeInsets.all(5),
                  child: Center(
                      child: Text(
                    "အနည်းဆုံးဖုန်းနံပါတ်တစ်ခု ဖြည့်သွင်းပေးပါ",
                    textAlign: TextAlign.center,
                  )),
                ),
        ],
      ),
    ));
  }

  InputDecoration _getInputDec(String hint, Icon icon) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(0),
      hintText: hint,
      prefixIcon: icon,
      fillColor: Colors.grey[200],
      filled: true,
      suffixIcon: _isOpt
          ? Padding(
              padding: const EdgeInsets.all(5.0),
              child: Image.asset(
                _optimag,
                height: 15,
                // width: 15,
                fit: BoxFit.fill,
              ),
            )
          : Padding(
          padding: const EdgeInsets.only(right:10.0),
          child: Icon(Icons.contact_phone)),
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
