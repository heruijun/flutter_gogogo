import 'package:flutter/material.dart';

class SunflowerPage extends StatefulWidget {
  final String title;

  const SunflowerPage({Key key, this.title}) : super(key: key);

  @override
  _SunflowerPageState createState() => new _SunflowerPageState();
}

class _SunflowerPageState extends State<SunflowerPage> {
  @override
  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: AppBar(
        centerTitle: true,
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
