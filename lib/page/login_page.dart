import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/common_button.dart';
import 'package:paymal/widget/v_empty_view.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> with TickerProviderStateMixin {
  Animation<double> _animation;
  AnimationController _controller;

  @override
  void initState() {
    super.initState();
    _controller =
        AnimationController(vsync: this, duration: Duration(milliseconds: 300));
    _animation = CurvedAnimation(parent: _controller, curve: Curves.linear);
    Future.delayed(Duration(milliseconds: 500), () {
      _controller.forward();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Stack(
        children: [
          Positioned(
            child: Text("Skip"),
            top: ScreenUtil().setWidth(80),
            right: ScreenUtil().setWidth(50),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(10.0),
              child: Text(
                "Register",
                style: Theme.of(context).textTheme.button,
              ),
            ),
          ),
          SingleChildScrollView(
            child: Container(
              padding: EdgeInsets.only(
                left: ScreenUtil().setWidth(80),
                right: ScreenUtil().setWidth(80),
                top: ScreenUtil().setWidth(150),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  _LoginAnimatedWidget(
                    animation: _animation,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class _LoginWidget extends StatefulWidget {
  @override
  __LoginWidgetState createState() => __LoginWidgetState();
}

class __LoginWidgetState extends State<_LoginWidget> {
  final TextEditingController _phoneController = TextEditingController();
  final TextEditingController _pwdController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: ThemeData(primaryColor: Colors.red),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: <Widget>[
          Container(
            margin: EdgeInsets.only(top: ScreenUtil().setHeight(100)),
            child: Text(
              'Welcome Back!',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.black87,
                fontSize: 34,
              ),
            ),
          ),
          VEmptyView(50),
          TextField(
            controller: _phoneController,
            keyboardType: TextInputType.phone,
            decoration: InputDecoration(
                hintText: 'Phone',
                prefixIcon: Icon(
                  Icons.phone_iphone,
                  color: Colors.grey,
                )),
          ),
          VEmptyView(40),
          TextField(
            obscureText: true,
            controller: _pwdController,
            decoration: InputDecoration(
                hintText: 'Password',
                prefixIcon: Icon(
                  Icons.lock,
                  color: Colors.grey,
                )),
          ),
          VEmptyView(120),
          Center(
            child: CommonButton(
              callback: () {
                NavigatorUtil.goHomePage(context);
              },
              content: 'Login',
              height: ScreenUtil().setHeight(80),
              width: ScreenUtil().setWidth(500),
            ),
          ),
          VEmptyView(50),
          Center(child: Text("OR")),
          Container(
            width: ScreenUtil().setWidth(500),
            margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
            child: new RaisedButton(
                padding: EdgeInsets.all(1.0),
                color: const Color(0xff4285F4),
                onPressed: () async {
                    NavigatorUtil.goHomePage(context);
                },
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Container(
                      padding: EdgeInsets.all(8.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                      ),
                      child: Image.asset(
                        "assets/image/google.png",
                        height: ScreenUtil().setHeight(50),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Text(
                          "Sign in with Google",
                          style: TextStyle(
                              color: Colors.white, fontWeight: FontWeight.bold),
                        )),
                  ],
                )),
          ),
          Container(
            width: ScreenUtil().setWidth(500),
            margin: EdgeInsets.fromLTRB(30.0, 5.0, 30.0, 5.0),
            child: new RaisedButton(
                padding: EdgeInsets.all(1.0),
                color: Colors.white,
                onPressed: () async {
                    NavigatorUtil.goHomePage(context);
                },
                child: new Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  mainAxisAlignment: MainAxisAlignment.start,
                  mainAxisSize: MainAxisSize.max,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Image.asset(
                        "assets/image/apple.png",
                        height: ScreenUtil().setHeight(50),
                      ),
                    ),
                    Container(
                        padding: EdgeInsets.only(left: 10.0, right: 10.0),
                        child: new Text(
                          "Sign in with Apple",
                          style: TextStyle(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        )),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class _LoginAnimatedWidget extends AnimatedWidget {
  final Tween<double> _opacityTween = Tween(begin: 0, end: 1);
  final Tween<double> _offsetTween = Tween(begin: 40, end: 0);
  final Animation animation;

  _LoginAnimatedWidget({
    @required this.animation,
  }) : super(listenable: animation);

  @override
  Widget build(BuildContext context) {
    return Opacity(
      opacity: _opacityTween.evaluate(animation),
      child: Container(
        margin: EdgeInsets.only(top: _offsetTween.evaluate(animation)),
        child: _LoginWidget(),
      ),
    );
  }
}
