import 'package:flutter/material.dart';
import 'package:paymal/pay_mal_icons.dart';
import 'package:paymal/utils/navigator_util.dart';

import '../language_constants.dart';

class PublicUtilitiesPage extends StatefulWidget {
  PublicUtilitiesPage({Key key}) : super(key: key);

  @override
  _PublicUtilitiesPageState createState() => _PublicUtilitiesPageState();
}

class _PublicUtilitiesPageState extends State<PublicUtilitiesPage> {
  List<String> _bill = [
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
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        title: Text(getTranslated(context, 'bublic_utilities')),
      ),
      body: SingleChildScrollView(
          child: Column(
        children: [
          //
          Column(
            children: _bill
                .map((e) => InkWell(
                      onTap: () {
                        NavigatorUtil.goPublicUtilitieDetails(context, e);
                      },
                      child: Card(
                        elevation: 0,
                        child: ListTile(
                          leading: Icon(PayMal.electric_bill),
                          title: Text(e),
                        ),
                      ),
                    ))
                .toList(),
          )
        ],
      )),
    );
  }
}
