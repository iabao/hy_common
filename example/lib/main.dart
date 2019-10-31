import 'package:flutter/material.dart';
import 'package:hy_common/common.dart';

void main() => runApp(MyApp());

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Plugin example app'),
        ),
        body: Center(
          child: Text(
              'width: ${HyScreenUtil.remainderWidth(0)}\nheight: ${HyScreenUtil.remainderHeight(0)}\n'),
        ),
      ),
    );
  }
}
