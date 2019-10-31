/*
 * 实现功能：
 * 
 * 创建时间：2019-10-21
 */
import 'package:flutter/material.dart';

class HyAppColor {
  static bool isDark = false;

  static Color mainColor() {
    return Color(0xFF0082FF);
  }

  static Color subordinateColor() {
    return Color(0xFF459DFF);
  }

  static Color viewTextColor() {
    return Color(0xFFFFFFFF);
  }

  static Color imageTextColor() {
    return Color(0xFF000000);
  }

  static Color pageBackgroundColor() {
    if (isDark) {
      return Color(0xFF000000);
    } else {
      return Colors.grey[50];
    }
  }

  static Color appBarBackgroundColor() {
    if (isDark) {
      return Colors.grey[900];
    } else {
      return Color(0xFFFFFFFF);
    }
  }

  static Color appBarTitleColor() {
    if (isDark) {
      return Color(0xFFFFFFFF);
    } else {
      return Color(0xFF1A1A1A);
    }
  }

  static Color itemBackgroundColor() {
    if (isDark) {
      return Colors.grey[900];
    } else {
      return Color(0xFFFFFFFF);
    }
  }

  static Color itemTitleColor() {
    if (isDark) {
      return Color(0xFFFFFFFF);
    } else {
      return Color(0xFF000000);
    }
  }

  static Color itemSubtitleColor() {
    if (isDark) {
      return Colors.grey[600];
    } else {
      return Colors.grey[700];
    }
  }

  static Color dialogBackgroundColor() {
    if (isDark) {
      return Colors.black.withOpacity(0.4);
    } else {
      return Colors.white.withOpacity(0.4);
    }
  }

  static Color dialogTitleColor() {
    if (isDark) {
      return Color(0xFFFFFFFF);
    } else {
      return Color(0xFF000000);
    }
  }

  static Color dialogContentColor() {
    if (isDark) {
      return Colors.grey[300];
    } else {
      return Colors.grey[700];
    }
  }

  static Color dialogLineColor() {
    if (isDark) {
      return Colors.grey[800];
    } else {
      return Colors.grey[200];
    }
  }
}
