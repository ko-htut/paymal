import 'package:flutter/material.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:pinput/pin_put/pin_put.dart';

class PinCodePage extends StatefulWidget {
  PinCodePage({Key key}) : super(key: key);

  @override
  _PinCodePageState createState() => _PinCodePageState();
}

class _PinCodePageState extends State<PinCodePage> {
  final _formKey = GlobalKey<FormState>();
  final _pinPutController = TextEditingController();
  final _pinPutFocusNode = FocusNode();
  final _pageController = PageController();

  int _pageIndex = 0;

  final List<Widget> _pinPuts = [];

  final List<Color> _bgColors = [
    Colors.white,
    const Color.fromRGBO(43, 36, 198, 1),
    Colors.white,
    const Color.fromRGBO(75, 83, 214, 1),
    const Color.fromRGBO(43, 46, 66, 1),
  ];

  @override
  void initState() {
    _pinPuts.addAll([
      onlySelectedBorderPinPut(),
    ]);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        child: Stack(
          fit: StackFit.passthrough,
          children: <Widget>[
            AnimatedContainer(
                color: _bgColors[_pageIndex],
                duration: const Duration(milliseconds: 200),
                padding: const EdgeInsets.only(left: 40.0, right: 40, top: 160),
                child: FractionallySizedBox(
                  heightFactor: 1.0,
                  child: Center(child: onlySelectedBorderPinPut()),
                )),
            _bottomAppBar,
            Positioned(
                top: 100,
                left: 0,
                right: 0,
                child: Center(
                    child: Text(
                  "Please enter passcode",
                  style: Theme.of(context).textTheme.headline6,
                ))),
          ],
        ),
      ),
    );
  }

  Widget onlySelectedBorderPinPut() {
    final BoxDecoration pinPutDecoration = BoxDecoration(
      color: Colors.blue,
      borderRadius: BorderRadius.circular(5.0),
    );
    return Form(
      key: _formKey,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          GestureDetector(
            onLongPress: () {
              print(_formKey.currentState.validate());
            },
            child: PinPut(
              obscureText: "●",
              validator: (s) {
                if (s.contains('1')) return null;
                return 'NOT VALID';
              },
              // useNativeKeyboard: false,
              // autovalidateMode: AutovalidateMode.onUserInteraction,
              withCursor: false,
              fieldsCount: 6,

              fieldsAlignment: MainAxisAlignment.spaceAround,
              textStyle: const TextStyle(fontSize: 25.0, color: Colors.black),
              eachFieldMargin: EdgeInsets.all(0),
              eachFieldWidth: 45.0,
              eachFieldHeight: 55.0,
              onSubmit: (String pin) => NavigatorUtil.goHomePage(context),
              focusNode: _pinPutFocusNode,
              controller: _pinPutController,
              submittedFieldDecoration: pinPutDecoration,
              selectedFieldDecoration: pinPutDecoration.copyWith(
                color: Colors.white,
                border: Border.all(width: 2, color: Colors.blue),
              ),
              followingFieldDecoration: pinPutDecoration,
              pinAnimationType: PinAnimationType.scale,
            ),
          ),
          GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            crossAxisSpacing: 10,
            mainAxisSpacing: 10,
            padding: const EdgeInsets.all(45),
            physics: NeverScrollableScrollPhysics(),
            children: [
              ...[1, 2, 3, 4, 5, 6, 7, 8, 9].map((e) {
                return RoundedButton(
                  title: '$e',
                  onTap: () {
                    _pinPutController.text = '${_pinPutController.text}$e';
                  },
                );
              }),
              Container(),
              RoundedButton(
                title: '0',
                onTap: () {
                  _pinPutController.text = '${_pinPutController.text}0';
                },
              ),
              RoundedButton(
                title: '<-',
                onTap: () {
                  if (_pinPutController.text.isNotEmpty) {
                    _pinPutController.text = _pinPutController.text
                        .substring(0, _pinPutController.text.length - 1);
                  }
                },
              ),
            ],
          ),
        ],
      ),
    );
  }

  Widget get _bottomAppBar {
    return Positioned(
      bottom: 0,
      left: 0,
      right: 0,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          TextButton(
            onPressed: () => NavigatorUtil.goLoginPage(context),
            child: const Text('Forgot Passcode?'),
          ),
        ],
      ),
    );
  }
}

class RoundedButton extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  RoundedButton({this.title, this.onTap});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: Colors.blue,
        ),
        alignment: Alignment.center,
        child: Text(
          '$title',
          style: TextStyle(fontSize: 20, color: Colors.white),
        ),
      ),
    );
  }
}
