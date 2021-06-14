import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/common_button.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class OTPPage extends StatefulWidget {
  OTPPage({Key key}) : super(key: key);

  @override
  _OTPPageState createState() => _OTPPageState();
}

class _OTPPageState extends State<OTPPage> {
  final TextEditingController _otpController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text(getTranslated(context, 'otp')),
      ),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            left: ScreenUtil().setWidth(80),
            right: ScreenUtil().setWidth(80),
            top: ScreenUtil().setWidth(20),
          ),
          child: Theme(
            data: ThemeData(primaryColor: Colors.red),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                //
                VEmptyView(30),
                Text(
                  getTranslated(context, 'otp_code_comfirm'),
                  style: Theme.of(context).textTheme.headline6,
                ),
                VEmptyView(30),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: _otpController,
                  keyboardType: TextInputType.number,
                  decoration: _getInputDec(getTranslated(context, 'otp_code'), Icon(AntIcons.number)),
                ),
                VEmptyView(20),
                RaisedButton(
                  color: Colors.blueAccent,
                  onPressed: () {
                    NavigatorUtil.goCreatePinCodePage(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(80),
                    child: Center(child: Text(getTranslated(context, 'comfirm'),style: TextStyle(color: Colors.white),),
                  ),
                ),)
              ],
            ),
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
