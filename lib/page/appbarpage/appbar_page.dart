import 'package:flutter/material.dart';

import 'appbar_gradient.dart';

class AppBarPage extends StatefulWidget {
  final String title;

  const AppBarPage({Key key, this.title}) : super(key: key);

  @override
  _AppBarPageState createState() => new _AppBarPageState();
}

class _AppBarPageState extends State<AppBarPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: GradientAppBar(
        gradientStart: Colors.blue[900],
        gradientEnd: Colors.blue[500],
        title: Text(widget.title),
      ),
      body: new Center(
        child: new Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            new Text(
              widget.title,
              style: TextStyle(fontSize: 32.0),
            ),
          ],
        ),
      ),
    );
  }
}
