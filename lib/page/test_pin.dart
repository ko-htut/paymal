// import 'dart:math';

// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/screen_util.dart';
// import 'package:paymal/utils/navigator_util.dart';
// import 'package:paymal/widget/key_pad.dart';
// import 'package:paymal/widget/v_empty_view.dart';
// import 'package:pinput/pin_put/pin_put.dart';

// class PinCodePage extends StatefulWidget {
//   PinCodePage({Key key}) : super(key: key);

//   @override
//   _PinCodePageState createState() => _PinCodePageState();
// }

// class _PinCodePageState extends State<PinCodePage> {
//   final TextEditingController _pinPutController = TextEditingController();
//   final FocusNode _pinPutFocusNode = FocusNode();

//   BoxDecoration get _pinPutDecoration {
//     return BoxDecoration(
//       border: Border.all(color: Colors.deepPurpleAccent),
//       borderRadius: BorderRadius.circular(15.0),
//     );
//   }

//   String displayCode;
//   TextEditingController pinController = TextEditingController();

//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//     displayCode = getNextCode();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//         body: Column(children: [
//       Container(
//         height: 200,
//         width: double.infinity,
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.only(
//             bottomLeft: Radius.circular(35),
//             bottomRight: Radius.circular(35),
//           ),
//           color: Colors.blueAccent,
//         ),
//         child: Stack(
//           children: [
//             Positioned(
//               left: 0,
//               right: 0,
//               bottom: 0,
//               child: Column(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Image.asset(
//                     "assets/logo/logo.png",
//                     width: ScreenUtil().setHeight(100),
//                   ),
//                   VEmptyView(10),
//                   Text(
//                     "Pin Code",
//                     style: Theme.of(context).textTheme.headline6,
//                   ),
//                   VEmptyView(10)
//                 ],
//               ),
//             ),
//           ],
//         ),
//       ),
//       Builder(
//         builder: (context) => Center(
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               Padding(
//                 padding: EdgeInsets.only(bottom: 20),
//                 child: Text(
//                   displayCode,
//                   style: TextStyle(
//                       color: Colors.blue,
//                       fontSize: 50,
//                       fontWeight: FontWeight.bold
//                       // fontFamily: AppTextStyle.robotoBold
//                       ),
//                 ),
//               ),
//               Padding(
//                 padding: EdgeInsets.only(left: 50, right: 50, bottom: 15),
//                 child: Container(
//                   decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(5),
//                       color: Colors.orangeAccent,
//                       border:
//                           Border.all(color: Colors.orangeAccent, width: 1.5)),
//                   child: Padding(
//                     padding: EdgeInsets.only(left: 15),
//                     child: TextField(
//                       controller: pinController,
//                       readOnly: true,
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                         color: Colors.black,
//                         fontSize: 26,
//                         // fontWeight: FontWeight.bold
//                         // fontFamily: AppTextStyle.robotoBold
//                       ),
//                       decoration: InputDecoration(
//                         border: InputBorder.none,
//                         hintText: 'Enter PIN',
//                       ),
//                       // controller: userDisplayName,
//                     ),
//                   ),
//                 ),
//               ),
//               KeyPad(
//                 pinController: pinController,
//                 isPinLogin: false,
//                 onChange: (String pin) {
//                   pinController.text = pin;
//                   print('${pinController.text}');
//                   setState(() {});
//                 },
//                 onSubmit: (String pin) {
//                   if (pin.length != 4) {
//                     (pin.length == 0)
//                         ? showInSnackBar('Please Enter Pin')
//                         : showInSnackBar('Wrong Pin');
//                     return;
//                   } else {
//                     pinController.text = pin;

//                     if (pinController.text == displayCode) {
//                       showInSnackBar('Pin Match');
//                       setState(() {
//                         displayCode = getNextCode();
//                       });
//                     } else {
//                       showInSnackBar('Wrong pin');
//                     }
//                     print('Pin is ${pinController.text}');
//                   }
//                 },
//               ),
//             ],
//           ),
//         ),
//       ),
//     ]));
//   }



//   void showInSnackBar(String value) {
//     Scaffold.of(context).showSnackBar(new SnackBar(content: new Text(value)));
//   }

//   getNextCode() {
//     pinController.text = '';
//     var rng = new Random();
//     var code = (rng.nextInt(9000) + 1000).toString();
//     print('Random No is : $code');
//     return code;
//   }
// }
