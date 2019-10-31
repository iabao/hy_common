/*
 * 实现功能：
 * 
 * 创建时间：2019-10-21
 */
import 'package:hy_common/config/hy_color.dart';
import 'package:flutter/material.dart';

class HyPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() {
    // TODO: implement createState
    return null;
  }
}

abstract class HyWidgetState<T extends StatefulWidget> extends State<T> {
  @override
  Widget build(BuildContext context) {
    HyAppColor.isDark = Theme.of(context).brightness == Brightness.dark;
    return hyBuild(context, HyAppColor.isDark);
  }

  Widget hyBuild(BuildContext context, bool isDark);
}
