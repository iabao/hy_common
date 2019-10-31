/*
 * 实现功能：
 * 
 * 创建时间：2019-10-22
 */
import 'package:flutter/material.dart';
import 'package:hy_common/config/hy_color.dart';
import 'package:hy_common/utils/hy_screen.dart';

class HyDialog {
  final BuildContext context;
  final String title;
  final String content;
  final List<HyAlertButton> actions;
  final bool canBack;

  HyDialog({
    this.context,
    this.title = "提示",
    this.content,
    this.actions,
    this.canBack = true,
  });

  show() {
    showDialog<void>(
      context: context,
      barrierDismissible: false, // user must tap button!
      builder: (BuildContext context) {
        return _HyAlertDialog(
          title: title,
          content: content,
          actions: actions,
          canBack: canBack,
        );
      },
    );
  }
}

class _HyAlertDialog extends StatelessWidget {
  final String title;
  final String content;
  final List<HyAlertButton> actions;
  final bool canBack;

  _HyAlertDialog({
    Key key,
    this.title,
    this.content,
    this.actions,
    this.canBack,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      child: AlertDialog(
        backgroundColor: HyAppColor.appBarBackgroundColor(),
        titlePadding: EdgeInsets.fromLTRB(
          HyScreenUtil.size(20),
          HyScreenUtil.size(20),
          HyScreenUtil.size(20),
          HyScreenUtil.size(10),
        ),
        contentPadding: EdgeInsets.all(0),
        title: Text(
          title,
          textAlign: TextAlign.center,
        ),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            Padding(
              padding: EdgeInsets.fromLTRB(
                HyScreenUtil.size(20),
                HyScreenUtil.size(0),
                HyScreenUtil.size(20),
                HyScreenUtil.size(15),
              ),
              child: Text(
                content,
                textAlign: TextAlign.center,
              ),
            ),
            Container(
              width: double.infinity,
              height: HyScreenUtil.size(1),
              color: HyAppColor.dialogLineColor(),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: _bottomButtons(),
            ),
          ],
        ),
      ),
      onWillPop: () async {
        return Future.value(canBack);
      },
    );
  }

  List<Widget> _bottomButtons() {
    if (actions != null && actions.length != 0) {
      if (actions.length > 1) {
        List<Widget> widgets = List();
        for (int i = 0; i < actions.length; i++) {
          widgets.add(actions[i]);
          if (i != actions.length - 1) {
            widgets.add(
              Container(
                width: HyScreenUtil.size(1),
                height: HyScreenUtil.size(25),
                color: HyAppColor.dialogLineColor(),
              ),
            );
          }
        }
        return widgets;
      } else {
        return actions;
      }
    } else {
      return [
        HyAlertButton(
          text: "确认",
        ),
      ];
    }
  }
}

class HyAlertButton extends StatelessWidget {
  final String text;
  final Function onClick;
  final Color textColor;

  HyAlertButton({
    Key key,
    this.text,
    this.onClick,
    this.textColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: FlatButton(
        onPressed: () {
          Navigator.pop(context);
          if (onClick != null) {
            onClick();
          }
        },
        padding: EdgeInsets.all(HyScreenUtil.size(10)),
        child: Text(
          text,
          maxLines: 1,
          overflow: TextOverflow.ellipsis,
          style: TextStyle(
            fontSize: HyScreenUtil.size(14),
            color: textColor ?? HyAppColor.subordinateColor(),
          ),
        ),
      ),
    );
  }
}
