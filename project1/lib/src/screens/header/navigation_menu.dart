import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/src/screens/header/menu_button.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';

class NavigationMenu extends GetView<ScreenLayoutController> {
  const NavigationMenu({
    super.key,
    required this.screenSizeType,
  });

  final ScreenSizeType screenSizeType;

  Widget _mobileLayout() {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Padding(
          padding: EdgeInsets.all(10.0),
          child: Icon(
            Icons.palette,
            color: Colors.blue,
            size: 70,
          ),
        ),
        MenuButton(
          menu: '설문하기',
          onTap: () {},
        ),
      ],
    );
  }

  Widget _desktopLayout() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const Row(
          children: [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(
                Icons.palette,
                color: Colors.blue,
                size: 70,
              ),
            ),
            Text(
              'COLORING',
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
        MenuButton(
          menu: '설문하기',
          onTap: () {},
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.desktop:
        return _desktopLayout();
      case ScreenSizeType.tablet:
        return _desktopLayout();
      case ScreenSizeType.mobile:
        return _mobileLayout();
    }
  }
}
