import 'package:flutter/material.dart';
import 'package:flutter_web_frame/flutter_web_frame.dart';
import 'package:project2/screens/home_page.dart';
import 'package:project2/theme/colors.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return FlutterWebFrame(
      builder: (context) => MaterialApp(
        title: 'Better Canvas',
        theme: ThemeData(
          fontFamily: 'Pretendard',
          useMaterial3: false,
        ),
        home: const HomePage(),
      ),
      maximumSize: const Size(360, 950),
      backgroundColor: ColorStyles.grey2,
    );
  }
}
