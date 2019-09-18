import 'package:flutter/material.dart';
import 'package:flutter_gogogo/page/appbarpage/appbar_page.dart';
import 'package:flutter_gogogo/page/calendarpage/calendar_page.dart';
import 'package:flutter_gogogo/page/listviewpage/listview_page.dart';
import 'package:flutter_gogogo/page/loadingpage/loading_page.dart';
import 'package:flutter_gogogo/page/sunflowerdemo/sunflower_page.dart';
import 'package:flutter_gogogo/page/testpage/test_page.dart';

class Router {
  static const testPage = 'app://testpage';
  static const loadingPage = 'app://loadingpage';
  static const calendarPage = 'app://calendarpage';
  static const appbarPage = 'app://appbarpage';
  static const sunflowerPage = 'app://sunflowerpage';
  static const listviewPage = 'app://listviewpage';

  Widget _getPage(String url, dynamic params) {
    switch (url) {
      case testPage:
        return TestPage(
          title: "路由测试页面",
        );
      case loadingPage:
        return LoadingPage(
          title: "加载框",
        );
      case calendarPage:
        return CalendarPage(
          title: "日历组件",
        );
      case appbarPage:
        return AppBarPage(
          title: "自定义AppBar",
        );
      case sunflowerPage:
        return SunflowerPage(title: "sunflower");
      case listviewPage:
        return ListviewPage(
          title: "列表",
        );
    }
  }

  Router.pushNoParams(BuildContext context, String url) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, null);
    }));
  }

  Router.push(BuildContext context, String url, dynamic params) {
    Navigator.push(context, MaterialPageRoute(builder: (context) {
      return _getPage(url, params);
    }));
  }
}
