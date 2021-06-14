import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

class EduDetailsPage extends StatefulWidget {
  EduDetailsPage({Key key}) : super(key: key);

  @override
  _EduDetailsPageState createState() => _EduDetailsPageState();
}

class _EduDetailsPageState extends State<EduDetailsPage> {
  final TextEditingController _studentIdController = TextEditingController();
  final TextEditingController _studentNameController = TextEditingController();
  final TextEditingController _studentRefIdController = TextEditingController();
  final TextEditingController _studentContactNumberController =
      TextEditingController();
  final TextEditingController _amountController = TextEditingController();
  final TextEditingController _description = TextEditingController();

  String _indexfeecategories = "Library";
  List<String> _feecategories = [
    "Library",
    "English Course / Placement Test",
    "Exam Serviecs",
    "Other",
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
    return Scaffold(
      appBar: AppBar(
        title: Text("British Council"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              //
              Card(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      ListTile(
                        leading: Icon(PayMal.education),
                        title: Text(
                          "British Council",
                          style: Theme.of(context).textTheme.headline6,
                        ),
                        tileColor: Colors.cyanAccent,
                      ),
                      // Container(
                      //   width: double.infinity,
                      //   // margin: EdgeInsets.all(5),
                      //   padding: EdgeInsets.all(5),
                      //   color: Colors.cyan[400],
                      //   child: Text(
                      //     "British Council",
                      //     style: Theme.of(context).textTheme.headline6,
                      //   ),
                      // ),
                      VEmptyView(10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _studentIdController,
                        keyboardType: TextInputType.number,
                        decoration:
                            _getInputDec("Student Id", Icon(PayMal.education)),
                      ),
                      VEmptyView(10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _studentNameController,
                        keyboardType: TextInputType.text,
                        decoration: _getInputDec(
                            "Student Name", Icon(PayMal.user_account)),
                      ),
                      VEmptyView(10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text(
                              "Fee Categories",
                              style: Theme.of(context).textTheme.button,
                            ),
                          ),
                          DropdownButton<String>(
                              items: _feecategories.map((String val) {
                                return DropdownMenuItem<String>(
                                  value: val,
                                  child: new Text(val),
                                );
                              }).toList(),
                              hint: Text(_indexfeecategories),
                              onChanged: (String val) {
                                _indexfeecategories = val;
                                setState(() {
                                  _indexfeecategories = val;
                                });
                              }),
                        ],
                      ),
                      VEmptyView(10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _studentRefIdController,
                        keyboardType: TextInputType.text,
                        decoration: _getInputDec(
                            "Reference Id", Icon(Icons.supervised_user_circle)),
                      ),
                      VEmptyView(10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _studentContactNumberController,
                        keyboardType: TextInputType.text,
                        decoration: _getInputDec(
                            "Contact Number", Icon(Icons.contact_phone)),
                      ),
                      VEmptyView(10),
                      TextField(
                        textInputAction: TextInputAction.next,
                        controller: _amountController,
                        keyboardType: TextInputType.text,
                        decoration: _getInputDec("Amount", Icon(PayMal.coupon)),
                      ),
                      VEmptyView(10),
                      TextField(
                        textInputAction: TextInputAction.done,
                        controller: _description,
                        keyboardType: TextInputType.text,
                        decoration: _getInputDec(
                            "Description", Icon(Icons.description)),
                      ),
                    ],
                  ),
                ),
              ),
              Card(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
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
                              getTranslated(context, "cash_in"),
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
    );
  }

  InputDecoration _getInputDec(String hint, Icon icon) {
    return InputDecoration(
      contentPadding: EdgeInsets.all(2),
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
