import 'package:flutter/material.dart';
import 'package:project2/widgets/custom_button.dart';

class PreSurveyPage extends StatelessWidget {
  const PreSurveyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(children: [
          CustomButton(
            text: '다음으로',
            onPressed: () {},
          ),
        ]),
      ),
    );
  }
}
