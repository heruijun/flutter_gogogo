import 'package:flutter/material.dart';

class TestPage extends StatefulWidget {
  final String title;

  const TestPage({Key key, this.title}) : super(key: key);

  @override
  _TestPageState createState() => new _TestPageState();
}

class _TestPageState extends State<TestPage> {
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
