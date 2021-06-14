import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/common_button.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../pay_mal_icons.dart';

class CreatePin extends StatefulWidget {
  CreatePin({Key key}) : super(key: key);

  @override
  _CreatePinState createState() => _CreatePinState();
}

class _CreatePinState extends State<CreatePin> {
  final TextEditingController _newpinController = TextEditingController();
  final TextEditingController _renewpinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text("Create Pin"),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            VEmptyView(20),
            TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 6,
                controller: _newpinController,
                decoration: _getInputDec(getTranslated(context, "new_passcode"), Icon(PayMal.password))),
            // VEmptyView(20),
            TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 6,
                controller: _renewpinController,
                decoration:
                    _getInputDec(getTranslated(context, "retype_passcode"), Icon(PayMal.password))),
            // VEmptyView(20)
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  NavigatorUtil.goAdSplashPage(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      "Create Passcode",
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            ),
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
