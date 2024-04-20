import 'package:flutter/material.dart';
import 'package:project1/src/firebase/auth.dart';
import 'package:project1/src/firebase/firestore.dart';
import 'package:project1/src/home.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginPage extends StatelessWidget {
  LoginPage({super.key});

  final TextEditingController _controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: SingleChildScrollView(
          physics: const BouncingScrollPhysics(),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        Padding(
                          padding:
                              EdgeInsets.only(bottom: 10, top: 10, right: 10),
                          child: Icon(
                            Icons.palette,
                            color: Colors.blue,
                            size: 70,
                          ),
                        ),
                        Text(
                          'COLORING',
                          style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Text(
                      '안녕하세요! 유저 스터디에 참여해 주셔서 감사합니다.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '해당 연구는 설문지의 질문을 바탕으로 프로그램을 사용해 보는 방식으로 이루어 집니다.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '따라서 먼저 폼을 열고 그에 따라 진행해 주시기 바랍니다.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[600],
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      '또한 PC로 진행할 것을 권장드립니다.',
                      style: TextStyle(
                        fontSize: 24,
                        color: Colors.grey[600],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 35),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    LoginBox(
                      controller: _controller,
                      text: 'User Name',
                      obscureText: false,
                    ),
                    const SizedBox(height: 5),
                    Text.rich(
                      TextSpan(
                        text: '',
                        children: [
                          const TextSpan(
                            text: '* ',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.red,
                            ),
                          ),
                          TextSpan(
                            text:
                                '식별을 위해서만 사용되며 본명일 필요는 없습니다. 단, 설문지에 입력한 이름과 동일하게 입력해 주세요.',
                            style: TextStyle(
                              fontSize: 18,
                              color: Colors.grey[600],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 30),
                SizedBox(
                  width: 810,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      if (_controller.text.isNotEmpty) {
                        await Auth.signInAnonymously().then((value) {
                          if (value != null) {
                            Firestore.addName(_controller.text);
                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) => const HomePage()));
                          }
                        });
                      } else {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title: const Text('알림'),
                              content: const Text('사용자 이름을 입력해 주세요.'),
                              actions: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.of(context).pop();
                                  },
                                  child: const Text('확인'),
                                ),
                              ],
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      '프로그램 시작하기',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: 810,
                  height: 48,
                  child: ElevatedButton(
                    onPressed: () async {
                      await launchUrl(
                        Uri(
                          scheme: 'https',
                          host: 'forms.gle',
                          path: 'reFwT8h6WU1yvwTx8',
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(5),
                      ),
                    ),
                    child: const Text(
                      '설문조사 폼 바로가기',
                      style: TextStyle(fontSize: 18),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class LoginBox extends StatelessWidget {
  const LoginBox({
    super.key,
    required this.controller,
    required this.text,
    required this.obscureText,
  });

  final TextEditingController controller;
  final String text;
  final bool obscureText;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 810,
      child: TextFormField(
        controller: controller,
        obscureText: obscureText,
        decoration: InputDecoration(
          labelText: text,
          labelStyle: const TextStyle(
            fontSize: 20,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              color: Colors.blue,
            ),
          ),
        ),
      ),
    );
  }
}
