import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/utils/navigator_util.dart';

import '../language_constants.dart';

class BillPaymentPage extends StatefulWidget {
  BillPaymentPage({Key key}) : super(key: key);

  @override
  _BillPaymentPageState createState() => _BillPaymentPageState();
}

class _BillPaymentPageState extends State<BillPaymentPage> {
  List<String> _bill = [
    "Cable TV",
    "Donation",
    "Education",
    "Fortune Telling",
    "Health",
    "Insurance Premium Payment",
    "Internet",
    "Repayment",
    "E-commerce",
    "Tickets",
    "Travel & Tours"
  ];

    List<String> _publicbill = [
    "(YESC) Yangon Electricity Bill",
    "(MESC) Mandalay Electricity Bill",
    "(ESE) Ayeyarwaddy Electricity Bill",
    "(ESE) Bago Electricity Bill",
    "(ESE) Kaya Electricity Bill",
    "(ESE) Kayin Electricity Bill",
    "(ESE) Magway Electricity Bill",
    "(ESE) Mon Electricity Bill",
    "(ESE) Nay Pyi Taw Electricity Bill",
    "(ESE) Sagaing Electricity Bill",
    "(ESE) Shan Electricity Bill",
  ];

  List<String> _cableTv = [
    "Canal+",
    "Skynet",
  ];
  List<String> _donation = [
    "Aye Yeik Mon Girls Orphanage School",
    "Khit Thit Foundation",
    "Kho Hlone Yar Elders Care Center",
    "Ko Gyi & Helping Hands",
    "We love Yangon",
    "Clean Yangon",
    "Covid 19 Vaccination Funds",
    "Pyay Ti Oo Educational Foundation",
  ];
  List<String> _education = [
    "British Council",
    "GUSTO University",
    "ILBC",
    "Strategy First",
    "Starfish Education",
    "Wall Street English",
    "Victoria University College",
  ];
  List<String> _fortune = ["1875 Bay Din", "Min thein Kha"];
  List<String> _health = [
    "Family Doctor",
    "Global Myanmar Medical Equipments",
    "Health4U",
    "Kathryn Beauty Myanmar",
    "Linn Myanmar Healthcare",
    "My Doctor ",
    "Myancare",
    "MyHealthCare",
    "Shwe Inn Wyne Natural Product",
    "Shwe Toe Pharmacy",
    "USA Medical Myanmar",
    "Yin Thway Medical Call Center"
  ];
  List<String> _insurance = [
    "FNI (General)",
    "FNI (Life)",
    "AYA SOMPO Insuranace Co., Ltd (MMK)",
    "Capital Taiyo Life Insurance Limited",
    "Dai-ichi Life Insurance Myanmar",
    "GGINL",
    "KBZ LIFE INSURANCE CO., LTD",
    "KBZ MS General Insurance",
    "Grand Guardian Tokio Marine General Insurance"
  ];
  List<String> _internet = [
    "5BB",
    "Anawrahta Internet",
    "Fortune",
    "Goldenet",
    "Infinite",
    "Linetic Internet",
    "Mahar Net",
    "Myanmar Link",
    "Net Core",
    "Ooredoo Fiber",
    "Stream Net",
    "Telenor",
    "True Net",
    "UNIlink",
    "Welink",
    "Yadanarpon Teleport"
  ];
  List<String> _repayment = [
    "AEON",
    "Imperial Myanmar Finance",
    "Mahar Bawga",
    "MO MO Finance"
  ];
  List<String> _ecom = [
    "ABC Beauty",
    "ESCORT Fashion",
    "mBuyy",
    "Metro",
    "rgo47",
    "SeinGayHar.com",
    "Zay2Go",
    "Zegobird"
  ];

  List<String> _travel = [
    "Ayarwaddy Legend Travels and Tours",
    "Flymya Tech Co., Ltd"
  ];

  List<String> _ticket = [
    "Air KBZ (Agent)",
    "Air KBZ (Bank Sale)",
    "BNF Express",
    "British Chamber",
    "Elite Express",
    "Elite Express",
    "Flymya.com",
    "JJ Express",
    "LODGGY",
    "MM Bus Ticket",
    "Myanmar ETC",
    "NguWar Bus Ticket",
    'Oway'
  ];

  
  List<IconData> _icon = [
    PayMal.cable_tv,
    PayMal.donation,
    PayMal.education,
    PayMal.fortune,
    PayMal.insurance,
    PayMal.healthcare,
    PayMal.internet,
    PayMal.loan_repayment,
    PayMal.e_commerce,
    PayMal.ticket,
    PayMal.travel,
  ];
  @override
  Widget build(BuildContext context) {
    List<List<String>> _data = [
      _cableTv,
      _donation,
      _education,
      _fortune,
      _health,
      _insurance,
      _internet,
      _repayment,
      _ecom,
      _ticket,
      _travel
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(getTranslated(context, 'bill_payment')),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Card(
              child: Column(
                  children: _bill.map((e) {
                var index = _bill.indexOf(e);
                return InkWell(
                  onTap: () {
                    NavigatorUtil.goBillDetailsPage(context,
                        title: e, list: _data[index], iconData: _icon[index]);
                  },
                  child: ListTile(
                      leading: Icon(_icon[index]),
                      title: Text(e),
                      trailing: Icon(AntIcons.info_circle)),
                );
              }).toList()),
            )
          ],
        ),
      ),
    );
  }
}
