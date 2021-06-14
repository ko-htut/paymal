import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class AdSplashPage extends StatefulWidget {
  AdSplashPage({Key key}) : super(key: key);

  @override
  _AdSplashPageState createState() => _AdSplashPageState();
}

class _AdSplashPageState extends State<AdSplashPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
      children: [
        //
        Expanded(
          child: Container(
            color: Colors.white,
            child: Stack(
              children: [
                //
                Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    bottom: 0,
                    child: Container(
                      height: ScreenUtil().setHeight(180),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Image.asset(
                            "assets/logo/icon.png",
                            width: ScreenUtil().setHeight(80),
                          ),
                          Text(
                            getTranslated(context, "wellcome_to_paymal"),
                          ),
                          VEmptyView(10)
                        ],
                      ),
                    )),
                Positioned(
                    right: 10,
                    top: 30,
                    child: InkWell(
                      onTap: () {
                        NavigatorUtil.goPinCodePage(context);
                      },
                      child: Container(
                          padding: EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            border: Border.all(
                              width: 1,
                              color: Colors.blue,
                            ),
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: Text(
                            getTranslated(context, 'pls_wait_1'),
                            style: TextStyle(color: Colors.blue),
                          )),
                    ))
              ],
            ),
          ),
        ),
        // Container(
        //   height: ScreenUtil().setHeight(180),
        //   child: Column(
        //     mainAxisAlignment: MainAxisAlignment.center,
        //     children: [
        //       Image.asset(
        //         "assets/logo/icon.png",
        //         width: ScreenUtil().setHeight(80),
        //       ),
        //       Text(getTranslated(context, "wellcome_to_paymal"),),
        //       VEmptyView(10)
        //     ],
        //   ),
        // )
      ],
    ));
  }
}
