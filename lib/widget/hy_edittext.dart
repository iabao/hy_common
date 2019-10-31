/*
 * 实现功能：
 * 
 * 创建时间：2019-10-21
 */
import 'package:flutter/material.dart';
import 'package:hy_common/config/hy_color.dart';
import 'package:hy_common/utils/hy_screen.dart';
import 'package:hy_common/widget/hy_page.dart';

class HyEditText extends StatefulWidget {
  final String defaultInput;
  final String hint;
  final bool isClearHide;
  final bool readOnly;
  final bool isEyeHide;
  final Color cursorColor;
  final TextInputType keyboardType;
  final TextInputAction textInputAction;
  final InputBorder border;
  final ValueChanged<String> inputTextChange;
  final Widget rightWidget;

  HyEditText({
    Key key,
    this.defaultInput = "",
    this.hint,
    this.isClearHide = false,
    this.readOnly = false,
    this.isEyeHide = true,
    this.cursorColor,
    this.keyboardType,
    this.textInputAction = TextInputAction.next,
    this.border,
    this.inputTextChange,
    this.rightWidget,
  }) : super(key: key);

  @override
  State<StatefulWidget> createState() {
    return _HyEditTextState();
  }
}

class _HyEditTextState extends HyWidgetState<HyEditText> {
  TextEditingController _controller;
  bool isClearHide, obscureText, isEyeHide;

  @override
  void initState() {
    super.initState();
    isClearHide = widget.isClearHide;
    obscureText = !widget.isEyeHide;
    isEyeHide = widget.isEyeHide;
    _controller = TextEditingController(text: widget.defaultInput);
  }

  @override
  Widget hyBuild(BuildContext context, bool isDark) {
    return Row(
      children: <Widget>[
        Expanded(
          child: TextField(
            onTap: () {},
            controller: _controller,
            onChanged: _textChange,
            style: TextStyle(
              fontSize: HyScreenUtil.size(14),
              color: HyAppColor.itemTitleColor(),
            ),
            readOnly: widget.readOnly,
            keyboardType: widget.keyboardType,
            textInputAction: widget.textInputAction,
            cursorColor: widget.cursorColor,
            textAlignVertical: TextAlignVertical.center,
            decoration: InputDecoration(
              hintText: widget.hint,
              hintStyle: TextStyle(
                fontSize: HyScreenUtil.size(14),
              ),
              border: widget.border,
              suffixIcon: Offstage(
                offstage: isClearHide,
                child: IconButton(
                  onPressed: () {
                    _controller = TextEditingController();
                    _textChange("");
                  },
                  iconSize: HyScreenUtil.size(20),
                  icon: Icon(
                    Icons.cancel,
                    color: HyAppColor.itemSubtitleColor(),
                  ),
                ),
              ),
            ),
            obscureText: obscureText,
          ),
        ),
        Offstage(
          offstage: isEyeHide,
          child: IconButton(
            onPressed: () {
              setState(() {
                obscureText = !obscureText;
              });
            },
            iconSize: HyScreenUtil.size(20),
            icon: Icon(
              obscureText ? Icons.visibility_off : Icons.visibility,
              color: HyAppColor.itemSubtitleColor(),
            ),
          ),
        ),
        widget.rightWidget == null
            ? SizedBox(width: 0, height: 0)
            : widget.rightWidget,
      ],
    );
  }

  void _textChange(String value) {
    setState(() {
      if (value == null || value.isEmpty) {
        isClearHide = true;
      } else {
        isClearHide = false;
      }
    });
    if (widget.inputTextChange != null) {
      widget.inputTextChange(value);
    }
  }
}
