import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/common_button.dart';
import 'package:paymal/widget/v_empty_view.dart';

class ChangePinPage extends StatefulWidget {
  ChangePinPage({Key key}) : super(key: key);

  @override
  _ChangePinPageState createState() => _ChangePinPageState();
}

class _ChangePinPageState extends State<ChangePinPage> {
  final TextEditingController _oldpinController = TextEditingController();
  final TextEditingController _newpinController = TextEditingController();
  final TextEditingController _renewpinController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(getTranslated(context, 'change_pin')),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            //
            VEmptyView(20),
            TextField(
                maxLength: 4,
                obscureText: true,
                controller: _oldpinController,
                keyboardType: TextInputType.number,
                decoration: _getInputDec(getTranslated(context, "old_passcode"), Icon(PayMal.password))),
            // VEmptyView(20),
            TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                controller: _newpinController,
                decoration: _getInputDec(getTranslated(context, "new_passcode"), Icon(PayMal.password))),
            // VEmptyView(20),
            TextField(
                keyboardType: TextInputType.number,
                obscureText: true,
                maxLength: 4,
                controller: _renewpinController,
                decoration:
                    _getInputDec(getTranslated(context, "retype_passcode"), Icon(PayMal.password))),
            // VEmptyView(20),
            Padding(
              padding: const EdgeInsets.only(top: 10.0),
              child: RaisedButton(
                color: Colors.blueAccent,
                onPressed: () {
                  NavigatorUtil.goHomePage(context);
                },
                child: Container(
                  height: 50,
                  width: double.infinity,
                  child: Center(
                    child: Text(
                      getTranslated(context, 'change_pin'),
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ),
              ),
            )
            // CommonButton(
            //   callback: () {
            //     NavigatorUtil.goHomePage(context);
            //   },
            //   content: getTranslated(context, 'change_pin'),
            //   height: ScreenUtil().setHeight(80),
            //   width: ScreenUtil().setWidth(500),
            // ),
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
