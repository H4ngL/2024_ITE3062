import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum ScreenSizeType { mobile, tablet, desktop }

class ScreenLayoutController extends GetxController {
  static ScreenLayoutController get to => Get.find();
  final Rx<ScreenSizeType> _screenType = ScreenSizeType.desktop.obs;
  Rx<ScreenSizeType> type = ScreenSizeType.desktop.obs;

  @override
  void onInit() {
    debounce(_screenType, (_) {
      type(_screenType.value);
    }, time: const Duration(milliseconds: 150));
    super.onInit();
  }

  void builder(BoxConstraints constraints) {
    if (constraints.maxWidth <= 480) {
      _screenType(ScreenSizeType.mobile);
    } else if (constraints.maxWidth <= 768) {
      _screenType(ScreenSizeType.tablet);
    } else {
      _screenType(ScreenSizeType.desktop);
    }
  }
}
