import 'package:flutter/material.dart';
import 'package:project2/screens/end_page.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_canvas.dart';

class CanvasPage extends StatelessWidget {
  const CanvasPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 32),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Text(
                '< 1 / 9 >',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '아래 네모칸의 "고양이"를\n따라 그려주세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.grey2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '귀여운 고양이입니다',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorStyles.darkPointColor,
                ),
              ),
              const SizedBox(height: 20),
              const CustomCanvas(
                size: Size(295, 381),
              ),
              const SizedBox(height: 20),
              CustomButton(
                text: '다음으로',
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          const EndPage(),
                      transitionsBuilder:
                          (context, animation, secondaryAnimation, child) =>
                              child,
                    ),
                  );
                },
                color: ColorStyles.grey0,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
