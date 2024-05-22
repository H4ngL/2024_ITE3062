import 'package:flutter/material.dart';
import 'package:project2/screens/end_page.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_canvas.dart';

const int maxIndex = 8;

List description = [
  '아래 네모칸의 "고양이"를\n따라 그려주세요',
  '아래 네모칸의 "나무"를\n따라 그려주세요',
  '아래 네모칸의 "사람"을\n따라 그려주세요',
  '아래 네모칸의 "하트"를\n따라 그려주세요',
  '아래 네모칸의 숫자 "5"를\n따라 적어주세요',
  '아래 네모칸의 알파벳 "A"를\n따라 적어주세요',
  '아래 네모칸의 글자 "한"을\n따라 적어주세요',
  '아래 네모칸의 한자 "愛"를\n따라 적어주세요',
];

List subDescription = [
  '시작해볼까요?',
  '이번엔 나무를 따라 그려봅시다',
  '이건 사람입니다',
  '하트를 따라 그려봅시다',
  '이번에는 숫자 5를 적어봅시다',
  '이제 별로 안 남았어요!',
  '글자 "한"을 적어봅시다',
  '마지막입니다!',
];

class CanvasPage extends StatelessWidget {
  const CanvasPage({
    super.key,
    required this.index,
  });

  final int index;

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
              Text(
                '< $index / $maxIndex >',
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                description[index - 1],
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.grey2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              Text(
                subDescription[index - 1],
                style: const TextStyle(
                  fontSize: 16,
                  color: ColorStyles.darkPointColor,
                ),
              ),
              const SizedBox(height: 35),
              CustomCanvas(
                  size: const Size(300, 300),
                  child: (index < 4)
                      ? Center(
                          child: Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              'assets/images/canvas_$index.png',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        )
                      : Center(
                          child: Opacity(
                            opacity: 0.2,
                            child: Image.asset(
                              'assets/images/canvas_1.png',
                              width: 200,
                              height: 200,
                            ),
                          ),
                        )),
              const SizedBox(height: 46),
              if (index != maxIndex)
                CustomButton(
                  text: '다음으로',
                  onPressed: () {
                    Navigator.of(context).push(
                      PageRouteBuilder(
                        pageBuilder: (context, animation, secondaryAnimation) =>
                            CanvasPage(index: index + 1),
                        transitionsBuilder:
                            (context, animation, secondaryAnimation, child) =>
                                child,
                      ),
                    );
                  },
                  color: ColorStyles.grey0,
                )
              else
                CustomButton(
                  text: '제출하기',
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
                )
            ],
          ),
        ),
      ),
    );
  }
}
