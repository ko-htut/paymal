import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:marquee_widget/marquee_widget.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

import '../language_constants.dart';

class MainFragment extends StatefulWidget {
  MainFragment({Key key}) : super(key: key);

  @override
  _MainFragmentState createState() => _MainFragmentState();
}

class _MainFragmentState extends State<MainFragment> {
  @override
  Widget build(BuildContext context) {
    List<Widget> list = [
      _categoryItem(
        name: getTranslated(context, 'top_up'),
        iconData: PayMal.topup,
        onTap: () {
          NavigatorUtil.goTopUpPage(context);
        },
      ),
      _categoryItem(
        name: getTranslated(context, 'data_package'),
        iconData: PayMal.datapack,
        onTap: () {
          NavigatorUtil.goDataPackpage(context);
        },
      ),
      _categoryItem(
        name: getTranslated(context, 'gift_card'),
        iconData: PayMal.gift_card_light,
        onTap: () {
          NavigatorUtil.goGiftCardPage(context);
        },
      ),
      _categoryItem(
        name: getTranslated(context, 'bublic_utilities'),
        iconData: PayMal.public_utility,
        onTap: () {
          NavigatorUtil.goPublicUtilities(context);
        },
      ),
      _categoryItem(
        name: getTranslated(context, 'bill_payment'),
        iconData: PayMal.bill_payment,
        onTap: () {
          NavigatorUtil.goBllPaymentPage(context);
        },
      ),
      _categoryItem(
        name: getTranslated(context, 'tickets'),
        iconData: PayMal.ticket,
        onTap: () => NavigatorUtil.goTicketPage(context),
      ),
      _categoryItem(
        name: getTranslated(context, 'coupons'),
        iconData: PayMal.coupon,
        onTap: () {
          NavigatorUtil.goCoupons(context);
        },
      ),
      _categoryItem(
        name: getTranslated(context, 'loyalty'),
        iconData: PayMal.loan_repayment,
        onTap: () {
          NavigatorUtil.goLoyaltyPage(context);
        },
      ),
    ];
    return Scaffold(
       appBar: AppBar(
        elevation: 2,
        backgroundColor: Colors.white,
        title: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Image.asset(
              "assets/logo/icon.png",
              width: ScreenUtil().setHeight(80),
            ),
            Text(
              "Paymal",
              style: TextStyle(color: Colors.black),
            )
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            VEmptyView(10),
            Wrap(
                children: list.map((e) => e).toList(),
              ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                elevation: 2,
                margin: EdgeInsets.all(5),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: AspectRatio(
                    aspectRatio: 16 / 9,
                    child: Container(
                      width: double.infinity,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(5),
                          color: Colors.grey),
                      child: Image.asset(
                        "assets/logo/mpss.png",
                        fit: BoxFit.fill,
                      ),
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

  Widget _categoryItem(
      {@required String name, void Function() onTap, IconData iconData}) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        // margin: EdgeInsets.all(2.0),
        color: Colors.blueAccent[50],
        elevation: 2,
        child: Padding(
          padding: const EdgeInsets.all(5.0),
         
          child: Container(
            width: MediaQuery.of(context).size.width / 3.7,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Column(
                children: [
                  Expanded(
                    child: ShaderMask(
                      shaderCallback: (Rect bounds) {
                        return RadialGradient(
                          center: Alignment.topLeft,
                          radius: 1.0,
                          colors: <Color>[
                            Colors.blueAccent[200],
                            Colors.grey[200],
                            Colors.lightBlue[200],
                            // Colors.white10
                          ],
                          tileMode: TileMode.mirror,
                        ).createShader(bounds);
                      },
                      child: Icon(
                        iconData,
                        size: 40,
                        color: Colors.blueAccent,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(0.0),
                    child: Marquee(
                      child: Text(
                        name,
                        maxLines: 1,
                        style: TextStyle(
                          fontFamily: "pyidaungsu",
                          fontSize: 15,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
