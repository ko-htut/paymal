import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

class PublicUtilitiesDetails extends StatefulWidget {
  final String title;
  PublicUtilitiesDetails({Key key, @required this.title}) : super(key: key);

  @override
  _PublicUtilitiesDetailsState createState() => _PublicUtilitiesDetailsState();
}

class _PublicUtilitiesDetailsState extends State<PublicUtilitiesDetails> {
  final TextEditingController _metternumberController = TextEditingController();
  final TextEditingController _barcodeController = TextEditingController();
  FocusNode _blankNode = FocusNode();
  bool _isSearching = true;
  String searchText;
  String searchText2;
  int _indexpayment = 0;
  List<String> _payment = [
    "assets/payment/AYAPay.png",
    "assets/payment/CBPay.png",
    "assets/payment/MPU.png",
    "assets/payment/Onepay.png",
  ];
  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        if (_isSearching) {
          setState(() {
            _metternumberController.text = "";
            _barcodeController.text = "";
            _isSearching = true;
          });

          return true;
        }

        return false;
      },
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.blueAccent,
          automaticallyImplyLeading: false,
          title: Text(widget.title),
          leading: IconButton(
            icon: Icon(
              Icons.keyboard_arrow_left,
              color: Colors.black,
            ),
            onPressed: () async {
              Navigator.pop(context);
            },
          ),
        ),
        body: SingleChildScrollView(
            child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            //
            _isSearching
                ? Container(
                    margin: EdgeInsets.all(15),
                    child: Column(
                      children: [
                        TextField(
                          textInputAction: TextInputAction.next,
                          controller: _metternumberController,
                          keyboardType: TextInputType.number,
                          decoration: _getInputDec(
                            "Meter Number",
                            Icon(PayMal.public_utility),
                          ),
                        ),
                        VEmptyView(25),
                        TextField(
                          textInputAction: TextInputAction.done,
                          controller: _barcodeController,
                          keyboardType: TextInputType.number,
                          decoration: _getInputDec("Barcode/CNP No./Ref No.",
                              Icon(AntIcons.barcode)),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: RaisedButton(
                            color: Colors.blueAccent,
                            onPressed: () {
                              //

                              searchText = _metternumberController.text.isEmpty
                                  ? '000000000'
                                  : _metternumberController.text;
                              searchText2 = _barcodeController.text.isEmpty
                                  ? '000000000'
                                  : _barcodeController.text;

                              _search();
                            },
                            child: Container(
                              height: 50,
                              width: double.infinity,
                              child: Center(
                                child: Text(
                                  getTranslated(context, "next"),
                                  style: TextStyle(color: Colors.white),
                                ),
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                  )
                : Container(
                    margin: EdgeInsets.all(5),
                    child: Listener(
                      onPointerDown: (d) {
                        FocusScope.of(context).requestFocus(_blankNode);
                      },
                      child: Column(
                        children: [
                          Card(
                            child: Container(
                              child: Column(
                                children: [
                                  VEmptyView(10),
                                  Container(
                                    padding: EdgeInsets.all(5),
                                    width: double.infinity,
                                    color: Colors.blueAccent[100],
                                    child: Text(widget.title,
                                        textAlign: TextAlign.center,
                                        style: TextStyle(
                                            color: Colors.white,
                                            fontSize: Theme.of(context)
                                                .textTheme
                                                .headline6
                                                .fontSize)),
                                  ),
                                  VEmptyView(10),
                                  _item("Service", widget.title),
                                  _item("Username", "U Thein Aung"),
                                  _item("Address",
                                      "273,Sanyar San Road, (33) ward"),
                                  _item("Township", "North Dagon"),
                                  _item("Meter Number", searchText),
                                  _item("Barcode /CNP No./Ref No.", searchText2),
                                  _item("Total Units", "100"),
                                  _item("Meter Consuming Amount", "12,000 MMK"),
                                  _item("Service Charges", "500 MMK"),
                                  Container(
                                    height: 45,
                                    child: Row(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceAround,
                                      children: [
                                        Expanded(
                                          flex: 1,
                                          child: Padding(
                                            padding: const EdgeInsets.all(8.0),
                                            child: Marquee(
                                                                                          child: Text(
                                                "Total Amount",
                                                textAlign: TextAlign.left,
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontWeight: FontWeight.normal,
                                                    fontSize: 17),
                                              ),
                                            ),
                                          ),
                                        ),
                                        Expanded(
                                          flex: 2,
                                          child: Text(
                                            "- 12,500 MMK ",
                                            style: TextStyle(
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontSize: 17),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          Card(
                            child: Column(
                              children: [
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
                                          borderRadius:
                                              BorderRadius.circular(5),
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
                                          getTranslated(context, "continue"),
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  ),
          ],
        )),
      ),
    );
  }

  Widget _item(String type, String name) {
    return Column(
      children: [
        Container(
          height: 35,
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            children: [
              Expanded(
                flex: 2,
                child: Padding(
                  padding: const EdgeInsets.only(left: 8.0),
                  child: Marquee(
                    child: Text(
                      type,
                      textAlign: TextAlign.left,
                      style: TextStyle(
                          color: Colors.black,
                          fontWeight: FontWeight.normal,
                          fontSize: 17),
                    ),
                  ),
                ),
              ),
              Expanded(
                flex: 4,
                child: Text(
                  " - " + name,
                  style: TextStyle(
                      color: Colors.black,
                      fontWeight: FontWeight.normal,
                      fontSize: 17),
                ),
              )
            ],
          ),
        ),
        Divider()
      ],
    );
  }

  void _search() {
    FocusScope.of(context).requestFocus(_blankNode);
    setState(() {
      _isSearching = false;
      _barcodeController.text = searchText2;
      _metternumberController.text = searchText;
    });
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
