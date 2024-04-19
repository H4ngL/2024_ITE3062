import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/firebase_options.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';
import 'package:project1/src/firebase/auth.dart';
import 'package:project1/src/home.dart';
import 'package:project1/src/screens/login/login_page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
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
      home: Auth.isSignedIn ? const HomePage() : LoginPage(),
    );
  }
}
