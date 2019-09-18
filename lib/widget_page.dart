import 'package:flutter/material.dart';
import 'package:flutter_gogogo/router/router.dart';

class WidgetPage extends StatefulWidget {
  @override
  _WidgetPageState createState() => new _WidgetPageState();
}

class _WidgetPageState extends State<WidgetPage> {
  final int rowCount = 3;

  @override
  Widget build(BuildContext context) {
    final List<Widget> labels = <Widget>[
      _widgetItem(Colors.red, '加载框', Router.loadingPage),
      _widgetItem(Colors.blue, '日期组件', Router.calendarPage),
      _widgetItem(Colors.brown, '渐变色\nAppBar', Router.appbarPage),
      _widgetItem(Colors.red, 'Flutter\nsunflower', Router.sunflowerPage),
      _widgetItem(Colors.brown, '列表', Router.listviewPage),
    ];

    return new Scaffold(
      body: Container(
          child: Stack(
        children: <Widget>[
          _buildLogo(),
          SafeArea(
            child: Container(
              padding: EdgeInsets.fromLTRB(10.0, 120.0, 10.0, 30.0),
              child: CustomScrollView(
                slivers: <Widget>[
                  SliverGrid(
                    gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent:
                          MediaQuery.of(context).size.width / rowCount,
                      mainAxisSpacing: 0.0,
                      crossAxisSpacing: 0.0,
                      childAspectRatio: 1.0,
                    ),
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                            alignment: Alignment.center,
                            padding: EdgeInsets.only(
                                top: 0, left: 5.0, right: 5.0, bottom: 5.0),
                            child: labels[index]);
                      },
                      childCount: labels.length, // 多放几张图片，让图片看上去比较多
                    ),
                  ),
                ],
              ),
            ),
          )
        ],
      )),
    );
  }

  Widget _widgetItem(Color color, String title, String url, [Object params]) {
    return FlatButton(
      child: AspectRatio(
        aspectRatio: 1.0,
        child: Container(
          color: color,
          child: Center(
            child: Text(
              title,
              textAlign: TextAlign.center,
              style: TextStyle(
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
      onPressed: () => {
        Router.push(context, url, params),
      },
    );
  }

  Widget _buildLogo() {
    return Container(
      padding: const EdgeInsets.only(bottom: 10.0, top: 5.0),
      decoration: BoxDecoration(
        image: DecorationImage(
            colorFilter: new ColorFilter.mode(
                Colors.black.withOpacity(0.2), BlendMode.dstATop),
            image: AssetImage('assets/images/flutter_logo.jpg'),
            alignment: Alignment.topCenter),
      ),
    );
  }
}
