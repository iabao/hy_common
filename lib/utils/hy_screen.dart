/*
 * 实现功能：
 * 
 * 创建时间：2019-10-21
 */
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:hy_common/config/hy_const.dart';

class HyScreenUtil {
  static bool isInit = false;
  static num _radio;
  static num _pageWidth;
  static num _pageHeight;

  static init(int initWidth) {
    MediaQueryData data = MediaQueryData.fromWindow(window);
    _pageWidth = data.size.width;
    _pageHeight = data.size.height;
    int width = initWidth is int ? initWidth : 375;
    _radio = data.size.width / width;
    isInit = true;
  }

  static num size(number) {
    if (!isInit) {
      init(HyConstant.uiWidth);
    }
    return number * _radio;
  }

  static remainderWidth(num useWidth) {
    if (!isInit) {
      init(HyConstant.uiWidth);
    }
    return _pageWidth - useWidth;
  }

  static remainderHeight(num useHeight) {
    if (!isInit) {
      init(HyConstant.uiWidth);
    }
    return _pageHeight - useHeight;
  }
}
