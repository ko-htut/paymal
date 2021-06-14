import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/v_empty_view.dart';

class ProfileEditPage extends StatefulWidget {
  ProfileEditPage({Key key}) : super(key: key);

  @override
  _ProfileEditPageState createState() => _ProfileEditPageState();
}

class _ProfileEditPageState extends State<ProfileEditPage> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();
  final TextEditingController _nrcController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        title: Text("Edit"),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //
                VEmptyView(30),
                CircleAvatar(
                  radius: 80.0,
                  child: ClipOval(
                    child: Stack(
                      children: [
                        Image.network(
                          "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
                        ),
                        Positioned(
                          bottom: 0,
                          left: 0,
                          right: 0,
                          child: Container(
                            height: 35,
                            color: Colors.white30,
                            child: Icon(
                              Icons.edit,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                  ),
                ),
                VEmptyView(25),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: _nameController,
                  keyboardType: TextInputType.name,
                  decoration: _getInputDec("Ko Htut",
                    Icon(AntIcons.user),
                  ),
                ),

                VEmptyView(25),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: _getInputDec("09777363991", Icon(AntIcons.phone)),
                ),
                VEmptyView(25),
                TextField(
                  textInputAction: TextInputAction.next,
                  controller: _emailController,
                  keyboardType: TextInputType.emailAddress,
                  decoration: _getInputDec("kohtutz1234@gmail.com", Icon(AntIcons.mail)),
                ),
                VEmptyView(25),
                TextField(
                  obscureText: true,
                  textInputAction: TextInputAction.next,
                  controller: _pwdController,
                  decoration: _getInputDec('*******',
                      Icon(AntIcons.lock_outline)),
                ),
                VEmptyView(25),
                 RaisedButton(
                  color: Colors.lightBlue,
                  onPressed: () {
                    NavigatorUtil.goHomePage(context);
                  },
                  child: Container(
                    width: double.infinity,
                    height: ScreenUtil().setHeight(80),
                    child: Center(child: Text(getTranslated(context, "comfirm"))),
                  ),
                ),
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
