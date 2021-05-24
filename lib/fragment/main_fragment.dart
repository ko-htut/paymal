import 'package:ant_icons/ant_icons.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/utils/navigator_util.dart';

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
    ];
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Wrap(
              children: list.map((e) => e).toList(),
            ),
            Padding(
              padding: const EdgeInsets.all(12.0),
              child: AspectRatio(
                aspectRatio: 16 / 9,
                child: Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.grey),
                    child: Icon(
                      AntIcons.question,
                    )),
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
        elevation: 0.5,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Container(
            width: MediaQuery.of(context).size.width / 3.8,
            child: AspectRatio(
              aspectRatio: 1 / 1,
              child: Column(
                children: [
                  Expanded(
                    child: Icon(
                      iconData,
                      size: 45,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(name),
                  ),
                ],
              ),
            ),
            // child: GridTile(
            //   child: Icon(
            //     iconData,
            //     size: 45,
            //   ),
            //   footer: Center(child: Text(name)),
            // ),
          ),
        ),
      ),
    );
  }
}
