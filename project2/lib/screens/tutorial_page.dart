import 'package:flutter/material.dart';
import 'package:project2/screens/home_page.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          CustomButton(
            text: '다음으로',
            onPressed: () {
              Navigator.of(context).push(
                PageRouteBuilder(
                  pageBuilder: (context, animation, secondaryAnimation) =>
                      const HomePage(),
                  transitionsBuilder:
                      (context, animation, secondaryAnimation, child) => child,
                ),
              );
            },
            color: ColorStyles.grey0,
          ),
        ]),
      ),
    );
  }
}
