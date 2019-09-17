import 'package:flutter/material.dart';
import 'package:flutter_gogogo/router/router.dart';

class FlutterPage extends StatefulWidget {
  @override
  _FlutterPageState createState() => new _FlutterPageState();
}

class _FlutterPageState extends State<FlutterPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      body: Container(
          child: Stack(
        children: <Widget>[
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                RaisedButton(
                  child: Text(
                    'Flutter',
                    style: TextStyle(fontSize: 32.0),
                  ),
                  color: Colors.blue,
                  textColor: Colors.white,
                  onPressed: () =>
                      Router.push(context, Router.testPage, '测试页面'),
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
