import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'dart:ui' as ui;
import 'package:project2/model/submit_info.dart';
import 'package:project2/screens/end_page.dart';
import 'package:project2/service/storage.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_canvas.dart';

const int maxIndex = 8;

class CanvasPage extends StatelessWidget {
  const CanvasPage({
    super.key,
    required this.index,
    required this.info,
  });

  final int index;
  final SubmitInfo info;

  @override
  Widget build(BuildContext context) {
    GlobalKey canvasKey = GlobalKey();

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
                  canvasKey: canvasKey,
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
                  onPressed: () async {
                    RenderRepaintBoundary boundary = canvasKey.currentContext!
                        .findRenderObject() as RenderRepaintBoundary;
                    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                    image
                        .toByteData(format: ui.ImageByteFormat.png)
                        .then((byteData) {
                      info.addDrawImage(byteData!.buffer.asUint8List());
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  CanvasPage(index: index + 1, info: info),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  child,
                        ),
                      );
                    });
                  },
                  color: ColorStyles.grey0,
                )
              else
                CustomButton(
                  text: '제출하기',
                  onPressed: () async {
                    RenderRepaintBoundary boundary = canvasKey.currentContext!
                        .findRenderObject() as RenderRepaintBoundary;
                    ui.Image image = await boundary.toImage(pixelRatio: 3.0);
                    image
                        .toByteData(format: ui.ImageByteFormat.png)
                        .then((byteData) {
                      info.addDrawImage(byteData!.buffer.asUint8List());
                      info.printInfo();
                      StorageService.saveImages(info);
                      Navigator.of(context).push(
                        PageRouteBuilder(
                          pageBuilder:
                              (context, animation, secondaryAnimation) =>
                                  const EndPage(),
                          transitionsBuilder:
                              (context, animation, secondaryAnimation, child) =>
                                  child,
                        ),
                      );
                    });
                  },
                )
            ],
          ),
        ),
      ),
    );
  }
}

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
