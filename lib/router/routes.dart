import 'package:fluro/fluro.dart' as f;
import 'package:flutter/material.dart';
import 'package:paymal/router/router_handler.dart';

class Routes {
  static String root = '/';
  static String home = '/home';
  static String profileeditpage = '/profileeditpage';
  static String login = '/login';
  static String register = '/register';
  static String otp = '/otp';
  static String tqpage = '/tqpage';
  static String userguide = '/userguide';
  static String topuppage = '/topuppage';
  static String datapackpage = '/datapackpage';
  static String giftcardpage = '/giftcardpage';
  static String giftcarddetailspage = '/giftcarddetailspage';
  static String ticketpage = '/ticketpage';
  static String publicutilitiespage = '/publicutilitiespage';
  static String billpaymentpage = '/billpaymentpage';
  static String couponspage = '/couponspage';
  static String loyaltyPage = '/loyaltyPage';
  static String privacypolicypage = '/privacypolicypage';

  static void configureRoutes(f.FluroRouter router) {
    router.notFoundHandler = new f.Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });
    router.define(home, handler: homeHanderl);
    router.define(profileeditpage, handler: profileeditHanderl);
    router.define(login, handler: loginHanderl);
    router.define(register, handler: registerHanderl);
    router.define(otp, handler: otpHanderl);
    router.define(topuppage, handler: topUpHanderl);
    router.define(datapackpage, handler: datapackHanderl);
    router.define(giftcardpage, handler: giftcardHanderl);
    router.define(giftcarddetailspage, handler: giftcarddetailsHanderl);
    router.define(ticketpage, handler: ticketHanderl);
    router.define(publicutilitiespage, handler: publicutilitiesHanderl);
    router.define(billpaymentpage, handler: billpaymentHanderl);
    router.define(couponspage, handler: couponsHanderl);
    router.define(loyaltyPage, handler: loyaltyHanderl);
    router.define(privacypolicypage, handler: privacypolicyHandler);
  }
}
