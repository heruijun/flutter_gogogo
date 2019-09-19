import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'my_app.dart';

void main() {
  // 清晰展示每个控件元素的布局边界
  debugPaintSizeEnabled = true;
  runApp(new MyApp());
}