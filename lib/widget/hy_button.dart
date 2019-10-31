import 'package:flutter/material.dart';
import 'package:hy_common/config/hy_color.dart';
import 'package:hy_common/utils/hy_screen.dart';

class ButtonWidget extends StatelessWidget {
  final double width;
  final double height;
  final String buttonText;
  final double buttonTextSize;
  final Color btnColor;
  final Color btnTextColor;
  final Function click;

  ButtonWidget({
    Key key,
    this.width,
    this.height,
    this.buttonText,
    this.buttonTextSize,
    this.click,
    this.btnColor,
    this.btnTextColor,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height ?? HyScreenUtil.size(40),
      margin: EdgeInsets.fromLTRB(
        HyScreenUtil.size(20),
        HyScreenUtil.size(0),
        HyScreenUtil.size(20),
        HyScreenUtil.size(0),
      ),
      child: FlatButton(
        color: btnColor ?? Theme.of(context).primaryColor,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(HyScreenUtil.size(4))),
        ),
        onPressed: click,
        child: Text(
          buttonText,
          style: TextStyle(
            fontSize: buttonTextSize ?? HyScreenUtil.size(18),
            color: btnTextColor ?? HyAppColor.viewTextColor(),
          ),
        ),
      ),
    );
  }
}
