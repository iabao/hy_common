/*
 * 实现功能：
 * 
 * 创建时间：2019-10-23
 */
import 'package:flutter/material.dart';
import 'package:hy_common/utils/hy_screen.dart';
import 'package:hy_common/config/hy_color.dart';

class ItemEnter extends StatelessWidget {
  final IconData icon;
  final String title;
  final Widget rightWidget;
  final Function onClick;
  final bool hasLine;

  ItemEnter({
    Key key,
    this.icon,
    this.title,
    this.rightWidget,
    this.onClick,
    this.hasLine = true,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return hasLine
        ? Column(
            children: <Widget>[
              _enter(),
              _line(),
            ],
          )
        : _enter();
  }

  Widget _enter() {
    return Container(
      width: double.infinity,
      height: HyScreenUtil.size(44),
      alignment: Alignment.center,
      color: HyAppColor.itemBackgroundColor(),
      padding: EdgeInsets.only(
        left: HyScreenUtil.size(20),
        right: HyScreenUtil.size(20),
      ),
      child: InkWell(
        onTap: onClick,
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            _iconText(),
            rightWidget == null
                ? Icon(
                    Icons.navigate_next,
                    size: HyScreenUtil.size(20),
                    color: HyAppColor.itemSubtitleColor(),
                  )
                : rightWidget,
          ],
        ),
      ),
    );
  }

  Widget _iconText() {
    return Row(
      children: <Widget>[
        Icon(
          icon,
          size: HyScreenUtil.size(22),
          color: HyAppColor.itemSubtitleColor(),
        ),
        Padding(
          padding: EdgeInsets.only(
            left: HyScreenUtil.size(10),
          ),
          child: Text(
            title,
            style: TextStyle(
              fontSize: HyScreenUtil.size(15),
              color: HyAppColor.itemSubtitleColor(),
            ),
          ),
        ),
      ],
    );
  }

  Widget _line() {
    return Container(
      width: double.infinity,
      height: HyScreenUtil.size(1),
      padding: EdgeInsets.only(left: HyScreenUtil.size(20)),
      color: HyAppColor.itemBackgroundColor(),
      child: Container(
        color: HyAppColor.pageBackgroundColor(),
      ),
    );
  }
}
