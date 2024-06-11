import 'package:flutter/material.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_toggle.dart';

class EndPage extends StatelessWidget {
  const EndPage({super.key});

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
              Image.asset(
                'assets/images/message_received_image.png',
                width: 200,
                height: 200,
              ),
              const SizedBox(height: 20),
              const Text(
                '설문에 참여해 주셔서\n감사합니다!',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              const Text(
                '수집된 정보는 오로지 유저 스터디를 위한\n목적으로만 사용됩니다:D',
                style: TextStyle(
                  fontSize: 16,
                  color: ColorStyles.grey2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 35),
              const CustomToggle(
                title: "그림이 이상하게 그려지는데...",
                content:
                    "해당 설문은 터치 경향 분석 뿐만이 아니라 터치 이벤트 Pan에 대해 어떠한 보정법이 가장 적합한지를 알아보고자 하는 목적도 있습니다. 따라서 사실 10개의 그림 중 8개의 그림은 다른 보정법이 적용되었습니다. 의식적이지 않은 터치 결과가 필요했기에 설문 마지막에 이러한 내용을 공개하게 된 점 양해 부탁드립니다.",
              ),
            ],
          ),
        ),
      ),
    );
  }
}
