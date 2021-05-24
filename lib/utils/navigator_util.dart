import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
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
  static void goOTPPage(BuildContext context) {
    _navigateTo(
      context,
      Routes.otp,
    );
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

  /// Ticket Page
  static void goTicketPage(BuildContext context) {
    _navigateTo(context, Routes.ticketpage);
  }

  /// Privacy Policy Page
  static void goPrivacyPolicy(BuildContext context) {
    _navigateTo(context, Routes.privacypolicypage);
  }
}
