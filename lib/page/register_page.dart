import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _pwdreController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Register"),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              //
              TextField(
                textInputAction: TextInputAction.next,
                controller: _nameController,
                keyboardType: TextInputType.name,
                decoration: _getInputDec(
                  getTranslated(context, 'name'),
                  Icon(AntIcons.user),
                ),
              ),

              VEmptyView(25),
              TextField(
                textInputAction: TextInputAction.next,
                controller: _phoneController,
                keyboardType: TextInputType.phone,
                decoration: _getInputDec(
                    getTranslated(context, 'ph_no'), Icon(AntIcons.phone)),
              ),
              VEmptyView(25),
              TextField(
                textInputAction: TextInputAction.next,
                controller: _emailController,
                keyboardType: TextInputType.emailAddress,
                decoration: _getInputDec(
                    getTranslated(context, 'email'), Icon(AntIcons.mail)),
              ),
              VEmptyView(25),
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
              VEmptyView(25),
              // ignore: deprecated_member_use
              RaisedButton(
                color: Colors.lightBlue,
                onPressed: () {
                  NavigatorUtil.goOTPPage(context);
                },
                child: Container(
                  width: double.infinity,
                  height: ScreenUtil().setHeight(80),
                  child: Center(
                    child: Text(
                      getTranslated(context, 'next'),
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
