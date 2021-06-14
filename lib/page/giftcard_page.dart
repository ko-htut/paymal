import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/utils/navigator_util.dart';

class GiftCardPage extends StatefulWidget {
  GiftCardPage({Key key}) : super(key: key);

  @override
  _GiftCardPageState createState() => _GiftCardPageState();
}

class _GiftCardPageState extends State<GiftCardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
          backgroundColor: Colors.blueAccent,
        title: Text(getTranslated(context, "gift_card")),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
               Text(
                "Best Selling",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Apple',
                        list: [
                          "5 USD",
                          "10 USD",
                          "15 USD",
                          "20 USD",
                          "25 USD",
                          "30 USD",
                          "50 USD",
                          "100 USD",
                        ],
                        image: 'assets/image/Slice.png',
                      );
                    },
                    image: "assets/image/Slice.png",
                  ),
                 myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Steam Wallet',
                        list: [
                          "USD 5.4",
                          "USD 10.8",
                          "USD 13.5",
                          "USD 27",
                          "USD 53.5",
                          "USD 107",
                        ],
                        image: 'assets/image/Steam Wallet.png',
                      );
                    },
                    image: "assets/image/Steam Wallet.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Text(
                "Entertainment",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Apple',
                        list: [
                          "5 USD",
                          "10 USD",
                          "15 USD",
                          "20 USD",
                          "25 USD",
                          "30 USD",
                          "50 USD",
                          "100 USD",
                        ],
                        image: 'assets/image/Slice.png',
                      );
                    },
                    image: "assets/image/Slice.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Spotify',
                        list: [
                          "10 USD",
                          "30 USD",
                          "60 USD",
                        ],
                        image: 'assets/image/Spotify.png',
                      );
                    },
                    image: "assets/image/Spotify.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Text(
                "Games",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Blade & Soul',
                        list: [
                          "400 NCoin",
                          "800 NCoin",
                          "1600 NCoin",
                          "4000 NCoin",
                          "8000 NCoin",
                        ],
                        image: 'assets/image/Blade & Soul.png',
                      );
                    },
                    image: "assets/image/Blade & Soul.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Fortnite',
                        list: [
                          "2800 V-BUCKS ",
                          "5000 V-Bucks ",
                          "13500 V-Bucks ",
                        ],
                        image: 'assets/image/Fortnite.png',
                      );
                    },
                    image: "assets/image/Fortnite.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Free Fire',
                        list: [
                          "110 Diamonds",
                          "231 Diamonds",
                          "231 Diamonds",
                          "1188 Diamonds",
                          "2420 Diamonds",
                        ],
                        image: 'assets/image/FreeFire.png',
                      );
                    },
                    image: "assets/image/FreeFire.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'IMVU',
                        list: [
                          "USD 10",
                          "USD 25",
                          "USD 50",
                        ],
                        image: 'assets/image/IMVU.png',
                      );
                    },
                    image: "assets/image/IMVU.png",
                  )
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Karma Koin',
                        list: [
                          "USD 10",
                          "USD 25",
                          "USD 50",
                        ],
                        image: 'assets/image/Karma Koin2.png',
                      );
                    },
                    image: "assets/image/Karma Koin2.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Minecraft',
                        list: [
                          "1720 Minecoins",
                          "3500 Minecoins",
                        ],
                        image: 'assets/image/Minecraft.png',
                      );
                    },
                    image: "assets/image/Minecraft.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Mobile Legends',
                        list: [
                          "56 Diamonds",
                          "278 Diamonds",
                          "571 Diamonds",
                          "1167 Diamonds",
                          "1783 Diamonds",
                          "3005 Diamonds",
                          "4770 Diamonds",
                          "6012 Diamonds",
                          "USD 10 (Starlight Membership)",
                          "USD 10 (Twilight Pass)",
                          "USD 10 (Starlight Membership Plus)",
                        ],
                        image: 'assets/image/Karma Koin2.png',
                      );
                    },
                    image: "assets/image/Karma Koin2.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Nintendo eShop',
                        list: [
                          "USD 10",
                          "USD 20",
                          "USD 35",
                          "USD 50",
                        ],
                        image: 'assets/image/Nintendo eShop.png',
                      );
                    },
                    image: "assets/image/Nintendo eShop.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Nintendo eShop',
                        list: [
                          "USD 10",
                          "USD 20",
                          "USD 25",
                          "USD 50",
                          "USD 60",
                          "USD 75",
                          "USD 100",
                        ],
                        image: 'assets/image/Nintendo eShop.png',
                      );
                    },
                    image: "assets/image/Nintendo eShop.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'PlayStation NOW',
                        list: [
                          "3 Months",
                          "12 Months",
                        ],
                        image: 'assets/image/PlayStation Network.png',
                      );
                    },
                    image: "assets/image/PlayStation Network.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'PUBG Mobile',
                        list: [
                          "60 UC ",
                          "300 + 25 UC",
                          "600 + 60 UC",
                          "1500 + 300 UC",
                          "3000 + 850 UC",
                          "8100 UC",
                        ],
                        image: 'assets/image/PUBG.png',
                      );
                    },
                    image: "assets/image/PUBG.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Razer Gold',
                        list: [
                          "USD 5",
                          "USD 10",
                          "USD 20",
                          "USD 50",
                          "USD 100",
                        ],
                        image: 'assets/image/Razer Gold.png',
                      );
                    },
                    image: "assets/image/Razer Gold.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Roblox',
                        list: [
                          "USD 10",
                          "USD 25",
                        ],
                        image: 'assets/image/Roblox.png',
                      );
                    },
                    image: "assets/image/Roblox.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'RuneScape',
                        list: [
                          "USD 10",
                          "USD 25",
                        ],
                        image: 'assets/image/Runescape.png',
                      );
                    },
                    image: "assets/image/Runescape.png",
                  ),
                ],
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Steam Wallet',
                        list: [
                          "USD 5.4",
                          "USD 10.8",
                          "USD 13.5",
                          "USD 27",
                          "USD 53.5",
                          "USD 107",
                        ],
                        image: 'assets/image/Steam Wallet.png',
                      );
                    },
                    image: "assets/image/Steam Wallet.png",
                  ),
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'XBOX',
                        list: [
                          "USD 10",
                          "USD 15",
                          "USD 25",
                          "USD 50",
                          "CALL OF DUTY: MODERN WARFARE STANDARD EDITION (59.99 USD)",
                          "1,100 CALL OF DUTY: MODERN WARFARE POINTS (9.99 USD)",
                          "2,400 CALL OF DUTY: MODERN WARFARE POINTS (19.99 USD)",
                          "APEX LEGENDS 2000 (+150 Bonus) Apex Coins (19.99 USD)",
                          "APEX LEGENDS 4000 (+350 Bonus) Apex Coins (39.99 USD)",
                          "NBA 2K20 (59.99USD)",
                          "NBA 2K20 35,000 VC Microsoft (9.99 USD)",
                          "NBA 2K20 75,000 VC Microsoft (19.99 USD)",
                          "NBA 2K20 200,000 VC Microsoft (49.99 USD)",
                          "GTA ONLINE: GREAT WHITE SHARK CASH CARD (19.99 USD)",
                          "GTA ONLINE: MEGALODON CASH CARD Microsoft (99.99 USD)",
                          "GTA ONLINE: WHALE SHARK CASH CARD Microsoft (49.99 USD)"
                        ],
                        image: 'assets/image/XBOX.png',
                      );
                    },
                    image: "assets/image/XBOX.png",
                  ),
                ],
              ),
              Text(
                "Communication",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                height: 10,
              ),
              Row(
                children: [
                  myCard(
                    click: () {
                      NavigatorUtil.goGiftCardDetailsPage(
                        context,
                        name: 'Skype',
                        list: [
                          "USD 10",
                          "USD 25",
                        ],
                        image: 'assets/image/Skype1.png',
                      );
                    },
                    image: "assets/image/Skype1.png",
                  ),
                ],
              ),
              Text(
                "Others",
                style: Theme.of(context).textTheme.headline6,
              ),
              Container(
                height: 10,
              ),
              Container(
                child: Row(
                  children: [
                    myCard(
                      click: () {
                        NavigatorUtil.goGiftCardDetailsPage(
                          context,
                          name: 'Amazon',
                          list: [
                            "USD 10",
                            "USD 25",
                            "USD 35",
                            "USD 50",
                            "USD 100",
                          ],
                          image: 'assets/image/Amazon.png',
                        );
                      },
                      image: "assets/image/Amazon.png",
                    ),
                    myCard(
                      click: () {
                        NavigatorUtil.goGiftCardDetailsPage(
                          context,
                          name: 'eBay',
                          list: [
                            "USD 10",
                            "USD 50",
                            "USD 100",
                          ],
                          image: 'assets/image/eBay.png',
                        );
                      },
                      image: "assets/image/eBay.png",
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget myCard({String image, Function click}) {
    return InkWell(
      onTap: click,
      child: Card(
        elevation: 0.4,
        child: Container(
          width:
              MediaQuery.of(context).size.width / 2 - ScreenUtil().setWidth(30),
          child: AspectRatio(
            aspectRatio: 16 / 9,
            child: Image.asset(
              image,
              fit: BoxFit.fill,
            ),
          ),
        ),
      ),
    );
  }
}
