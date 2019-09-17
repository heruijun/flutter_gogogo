import 'package:flutter/material.dart';

import 'fullscreen_demo.dart';

class CalendarPage extends StatefulWidget {
  final String title;

  const CalendarPage({Key key, this.title}) : super(key: key);

  @override
  _CalendarPageState createState() => new _CalendarPageState();
}

class _CalendarPageState extends State<CalendarPage> {
  List<DateTime> selectResult1 = <DateTime>[];
  List<DateTime> selectResult2 = <DateTime>[];

  // 全屏方式
  _navigateFullScreenDemo(BuildContext context) async {
    selectResult1 = await Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => FullScreenDemo()),
    );
  }

  // Dialog方式
  _navigateDailogDemo(BuildContext context) {
    showModalBottomSheet(
      context: context,
      builder: (BuildContext context) {
        return Container(
          height: 600.0,
          child: FullScreenDemo(),
        );
      },
    ).then((result) {
      setState(() {
        selectResult2 = result;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("列表型日历"),
      ),
      body: Center(
        child: Column(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            FlatButton(
              child: Text('全屏日历'),
              onPressed: () {
                _navigateFullScreenDemo(context);
              },
            ),
            Text(selectResult1.toString()),
            FlatButton(
              child: Text('弹出框日历'),
              onPressed: () {
                _navigateDailogDemo(context);
              },
            ),
            Text(selectResult2.toString()),
          ],
        ),
      ),
    );
  }
}
