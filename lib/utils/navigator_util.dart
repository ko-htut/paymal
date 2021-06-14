import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:paymal/page/bill_payment_details.dart';
import 'package:paymal/page/giftcard_details_page.dart';
import 'package:paymal/router/application.dart';
import 'package:paymal/router/routes.dart';
import 'package:paymal/utils/fluro_convert_utils.dart';
import 'package:paymal/utils/transparent_route.dart';

class NavigatorUtil {
  static _navigateTo(BuildContext context, String path,
      {bool replace = false,
      bool clearStack = false,
      Duration transitionDuration = const Duration(milliseconds: 250),
      RouteTransitionsBuilder transitionBuilder}) {
    Application.router.navigateTo(context, path,
        replace: replace,
        clearStack: clearStack,
        transitionDuration: transitionDuration,
        transitionBuilder: transitionBuilder,
        transition: TransitionType.material);
  }

  /// Login Page
  static void goLoginPage(BuildContext context) {
    _navigateTo(context, Routes.login, clearStack: true);
  }

  /// Register Page
  static void goRegisterPage(BuildContext context) {
    _navigateTo(
      context,
      Routes.register,
    );
  }

  /// Register Page
  static void goProfileEditPage(BuildContext context) {
    _navigateTo(
      context,
      Routes.profileeditpage,
    );
  }

  /// OTP Page
  static void goOTPPage(BuildContext context) {
    _navigateTo(
      context,
      Routes.otp,
    );
  }

  /// Home Page
  static void goAdSplashPage(BuildContext context) {
    _navigateTo(context, Routes.adsplashpage, clearStack: true);
  }

  /// Home Page
  static void goHomePage(BuildContext context) {
    _navigateTo(context, Routes.home, clearStack: true);
  }

  /// TopUp Page
  static void goTopUpPage(BuildContext context) {
    _navigateTo(context, Routes.topuppage);
  }

  /// Data Package Page
  static void goDataPackpage(BuildContext context) {
    _navigateTo(context, Routes.datapackpage);
  }

  /// Gift Card Page
  static void goGiftCardPage(BuildContext context) {
    _navigateTo(context, Routes.giftcardpage);
  }

  /// Gift Card Details Page
  static void goGiftCardDetailsPage(BuildContext context,
      {@required String name,
      @required String image,
      @required List<String> list}) {
    Navigator.push(
      context,
      TransparentRoute(
        builder: (_) => GiftCardDetailsPage(
          cardimage: image,
          cardname: name,
          items: list,
        ),
      ),
    );
  }

  static void goBillDetailsPage(BuildContext context,
      {@required String title,@required List<String> list,@required IconData iconData}) {
    Navigator.push(
      context,
      TransparentRoute(
        builder: (_) => BillPaymentDetails(
          title: title,
          data: list,
          iconData: iconData,
        ),
      ),
    );
  }

  /// Ticket Page
  static void goTicketPage(BuildContext context) {
    _navigateTo(context, Routes.ticketpage);
  }

  /// Pincode Page
  static void goCreatePinCodePage(BuildContext context) {
    _navigateTo(context, Routes.createpincode,clearStack: true);
  }

  /// Pincode Page
  static void goPinCodePage(BuildContext context) {
    _navigateTo(context, Routes.pincode,clearStack: true);
  }

  /// Change Pincode Page
  static void goChangePinCodePage(BuildContext context) {
    _navigateTo(context, Routes.changepincode);
  }

  /// Public Utilities Page
  static void goPublicUtilities(BuildContext context) {
    _navigateTo(context, Routes.publicutilitiespage);
  }
  /// Public Utilities Page
  static void goPublicUtilitieDetails(BuildContext context,String title) {
    _navigateTo(context, "${Routes.publicutilitiesdetailspage}?title=$title");
  }

  /// Coupons  Page
  static void goCoupons(BuildContext context) {
    _navigateTo(context, Routes.couponspage);
  }

  /// Bill Payment Page
  static void goBllPaymentPage(BuildContext context) {
    _navigateTo(context, Routes.billpaymentpage);
  }

  /// Loyalty Points Page
  static void goLoyaltyPage(BuildContext context) {
    _navigateTo(context, Routes.loyaltyPage);
  }

  /// Privacy Policy Page
  static void goPrivacyPolicy(BuildContext context) {
    _navigateTo(context, Routes.privacypolicypage);
  }

 
   /// Forgot Pin Pass
  static void goForgotPinPass(BuildContext context) {
    _navigateTo(context, Routes.forgotpinpass);
  }
    static void goForgotPH(BuildContext context) {
    _navigateTo(context, Routes.forgotph);
  }
   static void goForgotPss(BuildContext context) {
    _navigateTo(context, Routes.forgotpass);
  }

   static void goEduDetails(BuildContext context) {
    _navigateTo(context, Routes.edupagedetails);
  }
}
