import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/screen_util.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class ForgotPssPage extends StatefulWidget {
  ForgotPssPage({Key key}) : super(key: key);

  @override
  _ForgotPssPageState createState() => _ForgotPssPageState();
}

class _ForgotPssPageState extends State<ForgotPssPage> {
   final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pwdreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 0,
        title: Text("လုံခြုံရေးကုဒ်အားအသစ်ပြုလုပ်ပါ"),
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
                Text("လုံခြုံရေးကုဒ်အားအသစ်ပြုလုပ်ပါ",
                  style: Theme.of(context).textTheme.headline6,
                ),
                VEmptyView(30),
                TextField(
                obscureText: true,
                textInputAction: TextInputAction.next,
                controller: _pwdController,
                decoration: _getInputDec(getTranslated(context, 'password'),
                    Icon(AntIcons.lock_outline)),
              ),
              VEmptyView(25),
              TextField(
                textInputAction: TextInputAction.done,
                obscureText: true,
                controller: _pwdreController,
                decoration: _getInputDec(
                    getTranslated(context, 'comfirm_password'),
                    Icon(AntIcons.lock_outline)),
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
                    child: Center(
                      child: Text(
                        getTranslated(context, 'comfirm'),
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                )
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
