/*
 * 实现功能：
 * 
 * 创建时间：2019-10-21
 */
import 'package:hy_common/config/hy_color.dart';
import 'package:flutter/material.dart';
import 'package:hy_common/utils/hy_screen.dart';

final ThemeData hyLightTheme = _buildLightTheme();
final ThemeData hyDarkTheme = _buildDarkTheme();

ThemeData _buildLightTheme() {
  return _buildTheme(false);
}

ThemeData _buildDarkTheme() {
  return _buildTheme(true);
}

ThemeData _buildTheme(bool isDark) {
  HyAppColor.isDark = isDark;
  return ThemeData(
    brightness: isDark ? Brightness.dark : Brightness.light,
    primaryColorBrightness: isDark ? Brightness.dark : Brightness.light,
    accentColorBrightness: isDark ? Brightness.dark : Brightness.light,
    platform: TargetPlatform.iOS,
    scaffoldBackgroundColor: HyAppColor.pageBackgroundColor(),
    primaryColor: HyAppColor.mainColor(),
    appBarTheme: _appBarTheme(isDark),
    dialogTheme: _dialogTheme(isDark),
    toggleableActiveColor: HyAppColor.subordinateColor(),
    accentColor: HyAppColor.subordinateColor(),
  );
}

AppBarTheme _appBarTheme(bool isDark) {
  return AppBarTheme(
    brightness: isDark ? Brightness.dark : Brightness.light,
    color: HyAppColor.appBarBackgroundColor(),
    elevation: 1,
    textTheme: TextTheme(
      title: TextStyle(
        fontSize: HyScreenUtil.size(17),
        color: HyAppColor.appBarTitleColor(),
      ),
    ),
  );
}

DialogTheme _dialogTheme(bool isDark) {
  return DialogTheme(
    backgroundColor: HyAppColor.dialogBackgroundColor(),
    elevation: 0,
    titleTextStyle: TextStyle(
      color: HyAppColor.dialogTitleColor(),
      fontSize: HyScreenUtil.size(17),
      fontWeight: FontWeight.bold,
    ),
    contentTextStyle: TextStyle(
      color: HyAppColor.dialogContentColor(),
      fontSize: HyScreenUtil.size(15),
    ),
    shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.circular(10),
    ),
  );
}
