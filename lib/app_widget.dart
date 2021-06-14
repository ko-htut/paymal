import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:paymal/page/Splash_page.dart';
import 'package:paymal/router/application.dart';
import 'package:paymal/utils/navigate_service.dart';
import 'demo_localization.dart';
import 'language_constants.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

class AppWidget extends StatefulWidget {
  const AppWidget({Key key}) : super(key: key);
  static void setLocale(BuildContext context, Locale newLocale) {
    _AppWidgetState state = context.findAncestorStateOfType<_AppWidgetState>();
    state.setLocale(newLocale);
  }

  @override
  _AppWidgetState createState() => _AppWidgetState();
}

class _AppWidgetState extends State<AppWidget> {
  Locale _locale;
  setLocale(Locale locale) {
    setState(() {
      _locale = locale;
    });
  }

  @override
  void didChangeDependencies() {
    getLocale().then((locale) {
      setState(() {
        this._locale = locale;
      });
    });
    super.didChangeDependencies();
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(statusBarColor: Colors.transparent));
    return ScreenUtilInit(
      designSize: Size(750, 1334),
      builder: () => MaterialApp(
        theme: ThemeData(fontFamily: "pyidaungsu"),
        supportedLocales: [
          Locale("en", "US"),
          Locale("my", "MM"),
        ],
        locale: _locale,
        localizationsDelegates: [
          DemoLocalization.delegate,
          GlobalMaterialLocalizations.delegate,
          GlobalWidgetsLocalizations.delegate,
          GlobalCupertinoLocalizations.delegate,
        ],
        localeResolutionCallback: (locale, supportedLocales) {
          for (var supportedLocale in supportedLocales) {
            if (supportedLocale.languageCode == locale.languageCode &&
                supportedLocale.countryCode == locale.countryCode) {
              return supportedLocale;
            }
          }
          return supportedLocales.first;
        },
        navigatorKey: Application.getIt<NavigateService>().key,
        debugShowCheckedModeBanner: false,
        title: 'PAYMAL',
        home: SplashPage(),
        onGenerateRoute: Application.router.generator,
      ),
    );
  }
}

//  flutter pub run flutter_launcher_icons:main
//  <uses-permission android:name="android.permission.INTERNET" />
