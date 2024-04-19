import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/src/firebase/auth.dart';
import 'package:project1/src/screens/header/menu_button.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';
import 'package:project1/src/screens/login/login_page.dart';
import 'package:url_launcher/url_launcher.dart';

class NavigationMenu extends GetView<ScreenLayoutController> {
  const NavigationMenu({
    super.key,
    required this.screenSizeType,
  });

  final ScreenSizeType screenSizeType;

  Widget _mobileLayout(BuildContext context) {
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
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            MenuButton(
              menu: '설문하기',
              onTap: () async {
                await launchUrl(
                  Uri(
                    scheme: 'https',
                    host: 'forms.gle',
                    path: 'reFwT8h6WU1yvwTx8',
                  ),
                );
              },
            ),
            const SizedBox(width: 20),
            MenuButton(
              menu: '처음으로',
              onTap: () {
                Auth.signOut();
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage()));
              },
            )
          ],
        ),
      ],
    );
  }

  Widget _desktopLayout(BuildContext context) {
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
        const Spacer(),
        MenuButton(
          menu: '설문하기',
          onTap: () async {
            await launchUrl(
              Uri(
                scheme: 'https',
                host: 'forms.gle',
                path: 'reFwT8h6WU1yvwTx8',
              ),
            );
          },
        ),
        const SizedBox(width: 10),
        MenuButton(
          menu: '처음으로',
          onTap: () async {
            await Auth.signOut().then((value) {
              Navigator.of(context).pushReplacement(
                  MaterialPageRoute(builder: (context) => LoginPage()));
            });
          },
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    switch (screenSizeType) {
      case ScreenSizeType.desktop:
        return _desktopLayout(context);
      case ScreenSizeType.tablet:
        return _desktopLayout(context);
      case ScreenSizeType.mobile:
        return _mobileLayout(context);
    }
  }
}
