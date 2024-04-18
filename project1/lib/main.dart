import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';
import 'package:project1/src/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Coloring',
      theme: ThemeData(
        fontFamily: 'Pretendard',
        useMaterial3: false,
        splashColor: Colors.transparent,
        highlightColor: Colors.transparent,
      ),
      initialBinding: BindingsBuilder(() {
        Get.put(ScreenLayoutController());
      }),
      home: const HomePage(),
    );
  }
}
