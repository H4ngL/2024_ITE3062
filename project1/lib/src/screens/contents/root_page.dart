import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:project1/src/screens/contents/content.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';
import 'package:project1/src/screens/contents/result_palette.dart';

class RootPage extends StatelessWidget {
  const RootPage({
    super.key,
    required this.screenSizeType,
  });

  final ScreenSizeType screenSizeType;

  Widget _desktopLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 4,
            child: Content(
              screenSizeType: screenSizeType,
            ),
          ),
          Expanded(flex: 3, child: ResultPalette()),
        ],
      ),
    );
  }

  Widget _mobileLayout() {
    return Container(
      padding: const EdgeInsets.all(20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Content(
              screenSizeType: screenSizeType,
              vertical: true,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.desktop:
        return _desktopLayout();
      case ScreenSizeType.tablet:
        return _mobileLayout();
      case ScreenSizeType.mobile:
        return _mobileLayout();
    }
  }
}
