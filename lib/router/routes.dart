import 'package:fluro/fluro.dart' as f;
import 'package:flutter/material.dart';
import 'package:paymal/router/router_handler.dart';

class Routes {
  static String root = '/';
  static String adsplashpage = '/adsplashpage';
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
  static String publicutilitiesdetailspage = '/publicutilitiesdetailspage';
  static String billpaymentpage = '/billpaymentpage';
  static String couponspage = '/couponspage';
  static String loyaltyPage = '/loyaltyPage';
  static String privacypolicypage = '/privacypolicypage';
  static String pincode = '/pincode';
  static String changepincode = '/changepincode';
  static String createpincode = '/createpincode';
  static String forgotpinpass = '/forgotpinpass';
  static String forgotph = '/forgotph';
  static String forgotpass = '/forgotpass';
  static String edupagedetails = '/edupagedetails';

//   forgotpinpassHandler
// forgotphHandler
// forgotpassHandler

  static void configureRoutes(f.FluroRouter router) {
    router.notFoundHandler = new f.Handler(
        // ignore: missing_return
        handlerFunc: (BuildContext context, Map<String, List<String>> params) {
      print('ERROR====>ROUTE WAS NOT FONUND!!!');
    });
    router.define(adsplashpage, handler: adSplashHanderl);
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
    router.define(publicutilitiesdetailspage, handler: publicutilsDetailsHandler);
    router.define(billpaymentpage, handler: billpaymentHanderl);
    router.define(couponspage, handler: couponsHanderl);
    router.define(loyaltyPage, handler: loyaltyHanderl);
    router.define(privacypolicypage, handler: privacypolicyHandler);
    router.define(pincode, handler: pincodeHandler);
    router.define(changepincode, handler: changepincodeHandler);
    router.define(createpincode, handler: createpincodeHandler);
    router.define(forgotpass, handler: forgotpassHandler);
    router.define(forgotpinpass, handler: forgotpinpassHandler);
    router.define(forgotph, handler: forgotphHandler);
    router.define(edupagedetails, handler: edupagedetailsHandler);
  }
}
