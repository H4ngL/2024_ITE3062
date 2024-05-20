import 'package:flutter/material.dart';
import 'package:project2/screens/pre_survey_page.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Text(
              '나는 의도대로\n잘 그리고 있을까?',
              style: TextStyle(
                fontSize: 32,
                fontWeight: FontWeight.bold,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            const Text(
              '제시된 이미지를 따라 그리면\n점수를 알려드립니다!',
              style: TextStyle(
                fontSize: 24,
                fontWeight: FontWeight.w500,
                color: ColorStyles.grey2,
              ),
              textAlign: TextAlign.center,
            ),
            const SizedBox(height: 20),
            Image.asset(
              'assets/images/designer-image.png',
              width: 250,
              height: 258.65,
            ),
            const SizedBox(height: 20),
            const Row(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '*',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                    color: ColorStyles.grey1,
                  ),
                ),
                SizedBox(width: 5),
                Text(
                  '해당 설문은 캔버스 성능 향상을\n목적으로 진행됩니다',
                  style: TextStyle(
                    fontSize: 20,
                    color: ColorStyles.grey1,
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
            CustomButton(
              text: "시작하기",
              onPressed: () {
                Navigator.of(context).push(
                  PageRouteBuilder(
                    pageBuilder: (context, animation, secondaryAnimation) =>
                        const PreSurveyPage(),
                    transitionsBuilder:
                        (context, animation, secondaryAnimation, child) =>
                            child,
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}
