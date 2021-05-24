import 'package:flutter/material.dart';
import 'package:paymal/utils/navigator_util.dart';

class MainFragment extends StatefulWidget {
  MainFragment({Key key}) : super(key: key);

  @override
  _MainFragmentState createState() => _MainFragmentState();
}

class _MainFragmentState extends State<MainFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GridView.count(
        crossAxisCount: 3,
        padding: EdgeInsets.all(5),
        mainAxisSpacing: 3,
        crossAxisSpacing: 3,
        children: [
          _categoryItem(
            name: "Top-Up",
            iconData: Icons.ac_unit,
            onTap: () {
              NavigatorUtil.goTopUpPage(context);
            },
          ),
          _categoryItem(
            name: "Data Package",
            iconData: Icons.ac_unit,
            onTap: () {
              NavigatorUtil.goDataPackpage(context);
            },
          ),
          _categoryItem(
            name: "Gift Card",
            iconData: Icons.card_giftcard,
            onTap: () {
              NavigatorUtil.goGiftCardPage(context);
            },
          ),
          _categoryItem(
            name: "Public Utilities",
            iconData: Icons.ac_unit,
            onTap: () {},
          ),
          _categoryItem(
            name: "Bill Payment",
            iconData: Icons.ac_unit,
            onTap: () {},
          ),
          _categoryItem(
            name: "Tickets",
            iconData: Icons.ac_unit,
            onTap: () => NavigatorUtil.goTicketPage(context),
          ),
          _categoryItem(
            name: "Coupons",
            iconData: Icons.ac_unit,
            onTap: () {},
          ),
          _categoryItem(
            name: "Loyalty Points",
            iconData: Icons.ac_unit,
            onTap: () {},
          ),
        ],
      ),
    );
  }

  Widget _categoryItem(
      {@required String name, void Function() onTap, IconData iconData}) {
    return InkWell(
      onTap: () => onTap(),
      child: Card(
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: GridTile(
            child: Icon(
              iconData,
              size: 45,
            ),
            footer: Center(child: Text(name)),
          ),
        ),
      ),
    );
  }
}
