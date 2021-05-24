import 'package:flutter/material.dart';
import 'package:paymal/app_widget.dart';
import 'package:paymal/language.dart';
import 'package:paymal/language_constants.dart';
import 'package:paymal/utils/navigator_util.dart';
import 'package:paymal/widget/h_empty_view.dart';
import 'package:paymal/widget/v_empty_view.dart';

class AccountFragment extends StatefulWidget {
  AccountFragment({Key key}) : super(key: key);

  @override
  _AccountFragmentState createState() => _AccountFragmentState();
}

class _AccountFragmentState extends State<AccountFragment> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                  child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        VEmptyView(10),
                        CircleAvatar(
                          radius: 50.0,
                          child: ClipOval(
                            child: Image.network(
                              "https://www.atlassian.com/dam/jcr:ba03a215-2f45-40f5-8540-b2015223c918/Max-R_Headshot%20(1).jpg",
                            ),
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              VEmptyView(10),
                              Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    "Ko Htut",
                                    style:
                                        Theme.of(context).textTheme.headline5,
                                  ),
                                  HEmptyView(5),
                                  Icon(
                                    Icons.verified_user,
                                    color: Colors.blue,
                                    size: 15,
                                  )
                                ],
                              ),
                              VEmptyView(5),
                              Text("+(959) 777 363 991"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  Positioned(
                    right: 10,
                    child: InkWell(
                        onTap: () {
                          NavigatorUtil.goProfileEditPage(context);
                        },
                        child: Icon(Icons.edit)),
                  )
                ],
              )),
              VEmptyView(20),
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Setting",
                  style: Theme.of(context).textTheme.headline6,
                ),
              ),
              VEmptyView(10),
              Column(
                children: [
                  ListTile(
                    leading: Icon(Icons.language),
                    title: DropdownButton<Language>(
                      isExpanded: true,
                      isDense: true,
                      iconSize: 30,
                      iconEnabledColor: Colors.blue,
                      elevation: 6,
                      hint: Text(
                        getTranslated(context, 'change_language'),
                        style: TextStyle(
                            fontFamily: 'pyidaungsu',
                            color: Colors.blue,
                            fontSize: 16),
                      ),
                      onChanged: (Language language) {
                        _changeLanguage(language);
                      },
                      items: Language.languageList()
                          .map<DropdownMenuItem<Language>>(
                            (e) => DropdownMenuItem<Language>(
                              value: e,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.start,
                                children: <Widget>[
                                  Text(
                                    e.flag,
                                    style: TextStyle(
                                        fontFamily: 'pyidaungsu',
                                        color: Colors.blue),
                                  ),
                                  HEmptyView(20),
                                  Text(
                                    e.name,
                                    style: TextStyle(
                                        fontFamily: 'pyidaungsu',
                                        color: Colors.blue),
                                  )
                                ],
                              ),
                            ),
                          )
                          .toList(),
                    ),
                  ),
                  ListTile(
                    leading: Icon(Icons.pin),
                    title: Text(getTranslated(context, 'change_pin')),
                  ),
                  ListTile(
                    leading: Icon(
                      Icons.design_services_outlined,
                    ),
                    title: Text(getTranslated(context, 'change_theme')),
                  ),
                  Divider(),
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.green[50],
                      child: ClipOval(
                        child: Icon(
                          Icons.info_outline,
                          color: Colors.green,
                        ),
                      ),
                    ),
                    title: Text(
                      getTranslated(context, 'about'),
                      style: TextStyle(color: Colors.green),
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      NavigatorUtil.goPrivacyPolicy(context);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.green[50],
                        child: ClipOval(
                          child: Icon(
                            Icons.info_outline,
                            color: Colors.green,
                          ),
                        ),
                      ),
                      title: Text(
                        "Privacy & Security",
                        style: TextStyle(color: Colors.green),
                      ),
                    ),
                  ),
                  Divider(),
                  InkWell(
                    onTap: () {
                      NavigatorUtil.goLoginPage(context);
                    },
                    child: ListTile(
                      leading: CircleAvatar(
                        backgroundColor: Colors.red[50],
                        child: ClipOval(
                          child: Icon(
                            Icons.logout,
                            color: Colors.red,
                          ),
                        ),
                      ),
                      title: Text(
                        getTranslated(context, 'logout'),
                        style: TextStyle(color: Colors.red),
                      ),
                    ),
                  ),
                ],
              ),
              VEmptyView(10),
              Center(
                child: Text("Version v0.0.1"),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _changeLanguage(Language language) async {
    Locale _locale = await setLocale(language.languageCode);
    AppWidget.setLocale(context, _locale);
  }
}
