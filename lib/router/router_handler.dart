import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:paymal/page/ad_sp_page.dart';
import 'package:paymal/page/bill_payment_page.dart';
import 'package:paymal/page/change_pin_page.dart';
import 'package:paymal/page/coupons_page.dart';
import 'package:paymal/page/create_pin.dart';
import 'package:paymal/page/data_package_page.dart';
import 'package:paymal/page/edu_detaild_page.dart';
import 'package:paymal/page/forgot_pass.dart';
import 'package:paymal/page/forgot_phone.dart';
import 'package:paymal/page/forgot_pin_pass.dart';
import 'package:paymal/page/giftcard_details_page.dart';
import 'package:paymal/page/giftcard_page.dart';
import 'package:paymal/page/home_page.dart';
import 'package:paymal/page/login_page.dart';
import 'package:paymal/page/loyalty_points_page.dart';
import 'package:paymal/page/otp_page.dart';
import 'package:paymal/page/pin_code_page.dart';
import 'package:paymal/page/privacy_policy_page.dart';
import 'package:paymal/page/profile_edit_page.dart';
import 'package:paymal/page/public_utilities_details_page.dart';
import 'package:paymal/page/public_utilities_pages.dart';
import 'package:paymal/page/register_page.dart';
import 'package:paymal/page/ticket_page.dart';
import 'package:paymal/page/topup_page.dart';

Handler adSplashHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return AdSplashPage();
});

Handler loginHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

Handler registerHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

Handler otpHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return OTPPage();
});

Handler homeHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
});

Handler profileeditHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ProfileEditPage();
});

Handler topUpHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TopUpPage();
});

Handler datapackHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return DataPackagePage();
});

Handler giftcardHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return GiftCardPage();
});

Handler ticketHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return TicketPage();
});

Handler publicutilitiesHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PublicUtilitiesPage();
});

Handler billpaymentHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return BillPaymentPage();
});

Handler couponsHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CouponsPage();
});

Handler loyaltyHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return Loyanty();
});

Handler giftcarddetailsHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return GiftCardDetailsPage(
    cardname: 'Apple',
    items: [
      "5 USD",
      "10 USD",
      "15 USD",
      "20 USD",
      "25 USD",
      "30 USD",
      "50 USD",
      "100 USD",
      "200 USD",
      "300 USD",
      "400 USD",
      "500 USD",
    ],
    cardimage: 'assets/image/Slice.png',
  );
});

Handler privacypolicyHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PrivacyPolicyPage();
});

Handler pincodeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PinCodePage();
});

Handler changepincodeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ChangePinPage();
});
Handler createpincodeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return CreatePin();
});

Handler forgotpinpassHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ForgotPinPass();
});

Handler forgotphHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ForgotPhone();
});

Handler forgotpassHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return ForgotPssPage();
});

Handler edupagedetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return EduDetailsPage();
});

// EduDetailsPage

Handler publicutilsDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return PublicUtilitiesDetails(
    title: params['title'][0].toString(),
  );
});



