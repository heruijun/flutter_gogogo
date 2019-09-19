import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'about_page.dart';
import 'flutter_page.dart';
import 'generated/i18n.dart';
import 'provider/model/bottom_nav_bar_provider.dart';
import 'widget_page.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      localizationsDelegates: const [
        S.delegate,
        GlobalMaterialLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate,
      ],
      supportedLocales: S.delegate.supportedLocales,
      home: ChangeNotifierProvider<BottomNavBarProvider>(
        child: new MainPage(title: 'Flutter学习项目'),
        builder: (BuildContext context) => BottomNavBarProvider(),
      ),
    );
  }
}

class MainPage extends StatefulWidget {
  MainPage({Key key, this.title}) : super(key: key);
  final String title;

  @override
  _MainPageState createState() => new _MainPageState();
}

class _MainPageState extends State<MainPage> {
  var currentTab = [
    FlutterPage(),
    WidgetPage(),
    AboutPage(),
  ];

  @override
  Widget build(BuildContext context) {
    var provider = Provider.of<BottomNavBarProvider>(context);
    return new Scaffold(
      body: currentTab[provider.currentIndex],
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: provider.currentIndex,
        items: [
          BottomNavigationBarItem(
            icon: new Icon(Icons.home),
            title: new Text('Flutter'),
          ),
          BottomNavigationBarItem(
            icon: new Icon(Icons.favorite),
            title: new Text(S.of(context).title_widget),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.cloud_queue),
            title: Text(S.of(context).title_about),
          ),
        ],
        onTap: (index) {
          provider.currentIndex = index;
        },
      ),
    );
  }
}
