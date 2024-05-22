import 'package:flutter/material.dart';
import 'package:project2/model/submit_info.dart';
import 'package:project2/screens/canvas_page.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_canvas.dart';

class TutorialPage extends StatelessWidget {
  const TutorialPage({
    super.key,
    required this.info,
  });

  final SubmitInfo info;

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
                '연습하기',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '아래 네모칸에 손가락으로\n그림을 그릴 수 있습니다',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.grey2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '지우개는 사용할 수 없으니 주의해주세요',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorStyles.negativeColor,
                ),
              ),
              const SizedBox(height: 35),
              CustomCanvas(
                size: const Size(300, 300),
                info: info,
                child: const Center(
                  child: Text(
                    '여기에 그림을 그려보세요',
                    style: TextStyle(
                      fontSize: 16,
                      color: ColorStyles.grey1,
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 46),
              CustomButton(
                text: '시작하기!',
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            CanvasPage(index: 1, info: info),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                child),
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
