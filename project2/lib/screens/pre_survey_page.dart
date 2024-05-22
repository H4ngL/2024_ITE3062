import 'package:flutter/material.dart';
import 'package:project2/model/submit_info.dart';
import 'package:project2/screens/tutorial_page.dart';
import 'package:project2/theme/colors.dart';
import 'package:project2/widgets/custom_button.dart';
import 'package:project2/widgets/custom_radio.dart';
import 'package:uuid/uuid.dart';

class PreSurveyPage extends StatefulWidget {
  const PreSurveyPage({super.key});

  @override
  State<PreSurveyPage> createState() => _PreSurveyPageState();
}

class _PreSurveyPageState extends State<PreSurveyPage> {
  SubmitInfo info = SubmitInfo(
    uid: const Uuid().v4(),
    gender: 0,
    age: 20,
    phoneDegree: 0,
  );
  int gender = 0;
  int degree = 0;

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
                '시작하기 전',
                style: TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 10),
              const Text(
                '더 정확한 분석을 위해\n다음 질문에 답해주세요',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                  color: ColorStyles.grey2,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 20),
              SizedBox(
                height: 395,
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        '1. 당신의 성별은?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomRadio(
                        options: const ['남자', '여자'],
                        value: gender,
                        onChanged: (value) {
                          setState(() {
                            gender = value!;
                            info.setGender(value);
                          });
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '2. 당신의 만 나이는?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      TextField(
                        decoration: const InputDecoration(
                          hintText: '나이를 입력해주세요',
                        ),
                        onChanged: (value) {
                          info.setAge(int.parse(value));
                        },
                      ),
                      const SizedBox(height: 20),
                      const Text(
                        '3. 현재 스마트폰을 들고 있는 각도는?',
                        style: TextStyle(
                          fontSize: 18,
                        ),
                      ),
                      const SizedBox(height: 10),
                      CustomRadio(
                        options: const [
                          '눈높이와 비슷 (0도)',
                          '눈높이보다 약간 아래 (30도)',
                          '눈높이보다 아래 (60도)',
                        ],
                        value: degree,
                        onChanged: (value) {
                          setState(() {
                            degree = value!;
                            info.setPhoneDegree(value * 30);
                          });
                        },
                      ),
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 15),
              CustomButton(
                text: '다음으로',
                onPressed: () {
                  Navigator.of(context).push(
                    PageRouteBuilder(
                      pageBuilder: (context, animation, secondaryAnimation) =>
                          TutorialPage(info: info),
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
