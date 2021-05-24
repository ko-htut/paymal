import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:paymal/page/data_package_page.dart';
import 'package:paymal/page/giftcard_details_page.dart';
import 'package:paymal/page/giftcard_page.dart';
import 'package:paymal/page/home_page.dart';
import 'package:paymal/page/login_page.dart';
import 'package:paymal/page/register_page.dart';
import 'package:paymal/page/ticket_page.dart';
import 'package:paymal/page/topup_page.dart';

Handler loginHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return LoginPage();
});

Handler registerHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return RegisterPage();
});

Handler homeHanderl = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> params) {
  return HomePage();
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
