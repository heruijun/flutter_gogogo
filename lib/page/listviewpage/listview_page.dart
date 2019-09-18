import 'package:flutter/material.dart';

class ListviewPage extends StatefulWidget {
  final String title;

  const ListviewPage({Key key, this.title}) : super(key: key);

  @override
  _ListviewPageState createState() => _ListviewPageState();
}

class _ListviewPageState extends State<ListviewPage> {
  String listviewType = 'ListWhellScrollView';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('列表'),
        actions: <Widget>[
          PopupMenuButton(
            icon: Icon(Icons.more_vert),
            padding: EdgeInsets.all(0.0),
            itemBuilder: (BuildContext context) {
              return <PopupMenuItem<String>>[
                PopupMenuItem<String>(
                  child: Text("ListView方式"),
                  value: "ListView1",
                ),
                PopupMenuItem<String>(
                  child: Text("ListView.builder方式"),
                  value: "ListView2",
                ),
                PopupMenuItem<String>(
                  child: Text("ListView.separated方式"),
                  value: "ListView3",
                ),
                PopupMenuItem<String>(
                  child: Text("ListWhellScrollView方式"),
                  value: "ListWhellScrollView",
                ),
              ];
            },
            onSelected: (String action) {
              switch (action) {
                case "ListView1":
                  setState(() {
                    listviewType = 'ListView1';
                  });
                  break;
                case "ListView2":
                  setState(() {
                    listviewType = 'ListView2';
                  });
                  break;
                case "ListView3":
                  setState(() {
                    listviewType = 'ListView3';
                  });
                  break;
                case "ListWhellScrollView":
                  setState(() {
                    listviewType = 'ListWhellScrollView';
                  });
                  break;
              }
            },
            onCanceled: () {
              print("onCanceled");
            },
          ),
        ],
      ),
      body: _getListViewType(),
    );
  }

  Widget _getListViewType() {
    if (listviewType == 'ListView1') {
      return Listview_1();
    } else if (listviewType == 'ListView2') {
      return Listview_2();
    } else if (listviewType == 'ListView3') {
      return Listview_3();
    } else if (listviewType == 'ListWhellScrollView') {
      return ListWhellScrollView();
    }
  }
}

// ListView方式创建列表
class Listview_1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        padding: EdgeInsets.all(8.0),
        children: <Widget>[
          ListData.getList()[0],
          ListData.getList()[1],
          ListData.getList()[2],
          ListData.getList()[3],
          ListData.getList()[4],
          ListData.getList()[5],
          ListData.getList()[6],
          ListData.getList()[7],
        ],
      ),
    );
  }
}

// ListView.builder方式创建列表
class Listview_2 extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int position) {
    return ListData.getList()[position];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.builder(
        itemBuilder: (context, position) {
          return _itemBuilder(context, position);
        },
        itemCount: ListData.getList().length,
      ),
    );
  }
}

// ListView.separated方式创建,给子项之间添加分割线,分割组件可自定义
class Listview_3 extends StatelessWidget {
  Widget _itemBuilder(BuildContext context, int position) {
    return ListData.getList()[position];
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(8.0),
      child: ListView.separated(
        itemBuilder: (context, position) {
          return _itemBuilder(context, position);
        },
        itemCount: ListData.getList().length,
        separatorBuilder: (context, position) {
          return Container(height: 0.5, color: Colors.black12);
        },
      ),
    );
  }
}

// 实现轮轴效果列表
class ListWhellScrollView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListWheelScrollView(
        physics: ClampingScrollPhysics(),
        itemExtent: 90,
        children: ListData.getList(),
      ),
    );
  }
}

class ItemModel {
  var color;
  var icon;
  String mainTitle;
  String subTitle;
  String des;
  var readCount;

  ItemModel(this.color, this.icon, this.mainTitle, this.subTitle, this.des,
      this.readCount);
}

class ListData {
  static List<Widget> getList() {
    List<Widget> models = [];
    ItemModel model1 = ItemModel(Colors.blue, Icons.cloud, "新书推荐",
        "Flutter从0到1构建大前端应用", "电子工业出版社", 5000);
    ItemModel model2 = ItemModel(Colors.blue, Icons.cloud, "新书推荐",
        "新未来简史：区块链、人工智能、大数据陷阱与数字化生活", "电子工业出版社", 3222);
    ItemModel model3 = ItemModel(Colors.blue, Icons.cloud, "新书推荐",
        "TensorFlow：实战Google深度学习框架（第2版）", "电子工业出版社", 1855);
    ItemModel model4 = ItemModel(Colors.blue, Icons.cloud, "新书推荐",
        "人工智能产品经理——AI时代PM修炼手册", "电子工业出版社", 2999);
    ItemModel model5 = ItemModel(
        Colors.blue, Icons.cloud, "新书推荐", "第一本无人驾驶技术书", "电子工业出版社", 3566);
    ItemModel model6 = ItemModel(
        Colors.blue, Icons.cloud, "新书推荐", "神经网络与深度学习", "电子工业出版社", 2931);
    ItemModel model7 = ItemModel(Colors.blue, Icons.cloud, "新书推荐",
        "C++ Primer（中文版 第5版）", "电子工业出版社", 32122);
    ItemModel model8 = ItemModel(
        Colors.blue, Icons.cloud, "新书推荐", "高性能MySQL（第3版）", "电子工业出版社", 2103);

    models.add(ListviewItem(model1.color, model1.icon, model1.mainTitle,
        model1.subTitle, model1.des, model1.readCount));
    models.add(ListviewItem(model2.color, model2.icon, model2.mainTitle,
        model2.subTitle, model2.des, model2.readCount));
    models.add(ListviewItem(model3.color, model3.icon, model3.mainTitle,
        model3.subTitle, model3.des, model3.readCount));
    models.add(ListviewItem(model4.color, model4.icon, model4.mainTitle,
        model4.subTitle, model4.des, model4.readCount));
    models.add(ListviewItem(model5.color, model5.icon, model5.mainTitle,
        model5.subTitle, model5.des, model5.readCount));
    models.add(ListviewItem(model6.color, model6.icon, model6.mainTitle,
        model6.subTitle, model6.des, model6.readCount));
    models.add(ListviewItem(model7.color, model7.icon, model7.mainTitle,
        model7.subTitle, model7.des, model7.readCount));
    models.add(ListviewItem(model8.color, model8.icon, model8.mainTitle,
        model8.subTitle, model8.des, model8.readCount));
    return models;
  }
}

class ListviewItem extends StatelessWidget {
  var color;
  var icon;
  var mainTitle;
  var subTitle;
  var des;
  var readCount;

  ListviewItem(this.color, this.icon, this.mainTitle, this.subTitle, this.des,
      this.readCount);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.fromLTRB(10.0, 5.0, 10.0, 5.0),
      height: 90.0,
      child: Row(
        children: <Widget>[
          Container(
            width: 90.0,
            color: color,
            alignment: Alignment.center,
            child: Icon(icon, color: Colors.white),
          ),
          Padding(
            padding: EdgeInsets.only(right: 10),
          ),
          Expanded(
              child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                child: Text(
                  mainTitle,
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18.0),
                ),
              ),
              Expanded(child: Text(subTitle, style: TextStyle(fontSize: 14.0))),
              Expanded(
                child: Text(
                  des,
                  style: TextStyle(fontSize: 13.0),
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              Expanded(
                child: Text(
                  "${readCount.toString()} 条评价",
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 14.0,
                      color: Colors.blue),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
