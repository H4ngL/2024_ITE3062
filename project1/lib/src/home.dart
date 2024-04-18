import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/src/screens/footer/footer.dart';
import 'package:project1/src/screens/header/navigation_menu.dart';
import 'package:project1/src/screens/contents/root_page.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        LayoutBuilder(
          builder: (context, constraints) {
            ScreenLayoutController.to.builder(constraints);
            return Container();
          },
        ),
        Obx(
          () => Scaffold(
            body: Center(
              child: SizedBox(
                width: 1280,
                child: Column(
                  children: [
                    NavigationMenu(
                        screenSizeType: ScreenLayoutController.to.type.value),
                    Expanded(
                        child: RootPage(
                            screenSizeType:
                                ScreenLayoutController.to.type.value)),
                    const Footer(),
                  ],
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
