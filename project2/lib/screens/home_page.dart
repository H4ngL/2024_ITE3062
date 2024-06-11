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
        padding: const EdgeInsets.symmetric(horizontal: 30),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '나는 얼마나 잘\n따라 그릴까?',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '제시된 이미지를 따라 그리는\n설문조사입니다!',
                style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.grey2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Image.asset(
                'assets/images/designer_image.png',
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
                    '해당 설문은 유저의 터치 성향 분석을\n목적으로 진행됩니다',
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
      ),
    );
  }
}
