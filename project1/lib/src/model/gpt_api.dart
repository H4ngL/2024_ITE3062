import 'dart:convert';
import 'dart:math';
import 'package:http/http.dart' as http;
import 'package:project1/src/controller/main_type_controller.dart';
import 'package:project1/src/controller/setting.dart';

class GPTApi {
  static String apiKey = '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';

  static String opacityToHex(double opacity) {
    int alpha = (opacity * 255).round();
    String alphaHex = alpha.toRadixString(16).padLeft(2, '0').toUpperCase();
    return alphaHex;
  }

  static Future<List<String>> getGPTResponse(
      {required String prompt,
      required MainType type,
      int count = 6,
      ColorMix? mix,
      double? opacity}) async {
    String newPrompt = "";
    switch (type) {
      case MainType.prompt:
        newPrompt = "$prompt 와 관련된 서로 다른 $count 가지 색상을 추천해줘.\n";
        break;
      case MainType.code:
        newPrompt = "$prompt 와 관련된 서로 다른 $count 가지 색상을 추천해줘.\n";
        newPrompt += "결과에는 $prompt 가 포함되어야 하며, $prompt 는 0번 자리에 위치해야 해.\n";
        break;
      case MainType.color:
        newPrompt = "$prompt 와 관련된 서로 다른 $count 가지 색상을 추천해줘.\n";
        newPrompt += "결과에는 $prompt 가 포함되어야 하며, $prompt 는 0번 자리에 위치해야 해.\n";
        break;
    }

    if (mix != null) {
      newPrompt += "색상 조화는 ${mix.name} 해야 해.\n";
      newPrompt +=
          "'analogic'는 인접한 색상, 'contrast'는 대비가 강한 색상, 'monochromatic'은 동일한 색조의 다양한 명암을 의미해.\n";
    }

    newPrompt +=
        "결과는 리스트 형태여야 하며, 각 색상은 6자리의 16진수로 표현되어야 해. 출력 포멧은 무조건 다음을 따라야 해. ex) ['#ffffff', '#000000', '#ff0000']";
    var response = await http.post(
      Uri.parse('https://api.openai.com/v1/chat/completions'),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': 'Bearer $apiKey',
      },
      body: jsonEncode({
        "model":
            "gpt-3.5-turbo-0125", //gpt-4-turbo-preview or gpt-3.5-turbo-0125
        "messages": [
          {"role": "system", "content": "User: $newPrompt"},
          {"role": "user", "content": "Generate"},
        ],
        "temperature": 0.5,
        "top_p": 1,
        "n": 1,
      }),
    );

    if (response.statusCode == 200) {
      Map<String, dynamic> data = jsonDecode(response.body);
      String content = data['choices'][0]['message']['content'];
      List<String> result = content
          .replaceAll("[", "")
          .replaceAll("]", "")
          .replaceAll("'", "")
          .split(", ");
      if (opacity != null && opacity != 1.0) {
        result = result.map((color) {
          String rgbaColor = color.substring(1, 7);
          String alphaChannel = opacityToHex(opacity);
          return "#$alphaChannel$rgbaColor";
        }).toList();
      }
      return result;
    } else {
      throw Exception('Failed to load response : ${response.statusCode}');
    }
  }

  static Future<List<dynamic>> getColorFeatures(List<String> colorList) async {
    final List<String> roles = [
      'primary color',
      'secondary color',
      'background color',
      'text color',
      'accent color'
    ];
    final Random random = Random();

    List<dynamic> result = [];
    int totalPercentage = 100;
    int remainingColors = colorList.length;

    bool primaryColorSelected = false;

    for (int i = 0; i < colorList.length; i++) {
      int maxPercentage = (totalPercentage / remainingColors).floor();
      int percentage = (i == colorList.length - 1)
          ? totalPercentage
          : random.nextInt(maxPercentage - 4) + 5;
      totalPercentage -= percentage;
      remainingColors--;

      if (!primaryColorSelected &&
          ((i == colorList.length - 1) ||
              (remainingColors == 1) ||
              (i > 0 && result[i - 1]['role'] != 'primary color'))) {
        result.add({
          'color': colorList[i],
          'percentage': percentage,
          'role': 'primary color',
        });
        primaryColorSelected = true;
      } else {
        String role = roles.firstWhere(
            (role) =>
                role != 'primary color' &&
                !result.any((color) => color['role'] == role),
            orElse: () => roles[random.nextInt(roles.length)]);
        result.add({
          'color': colorList[i],
          'percentage': percentage,
          'role': role,
        });
      }
    }

    return result;
  }

  // static Future<List<dynamic>> getColorFeatures(List<String> colorList) async {
  //   String newPrompt = "UI/UX 디자이너의 관점에서 다음 제시되는 색상에 대해 중요도(%)와 알맞는 역할을 정해줘.\n";
  //   newPrompt +=
  //       "역할은 'primary color', 'secondary color', 'background color', 'text color', 'accent color' 등이 될 수 있으며 어울리는 것과 매치되어야 해.\n";
  //   newPrompt += "색상은 다음과 같아 : ";
  //   for (int i = 0; i < colorList.length; i++) {
  //     newPrompt += colorList[i];
  //     if (i != colorList.length - 1) {
  //       newPrompt += ", ";
  //     }
  //   }
  //   newPrompt += "\n";
  //   newPrompt +=
  //       "출력 포멧은 무조건 다음을 따라야 해. 즉, json으로 꼭 인코딩할 수 있어야 해. ex) [{'color': '#ffffff', 'percentage': 60, 'role': 'primary color'}, {'color': '#000000', 'percentage': 40, 'role': 'background color'}]";
  //   try {
  //     var response = await http.post(
  //       Uri.parse('https://api.openai.com/v1/chat/completions'),
  //       headers: {
  //         'Content-Type': 'application/json',
  //         'Authorization': 'Bearer $apiKey',
  //       },
  //       body: jsonEncode({
  //         "model":
  //             "gpt-3.5-turbo-0125", //gpt-4-turbo-preview or gpt-3.5-turbo-0125
  //         "messages": [
  //           {"role": "system", "content": "User: $newPrompt"},
  //           {"role": "user", "content": "Generate"},
  //         ],
  //         "temperature": 0.5,
  //         "top_p": 1,
  //         "n": 1,
  //       }),
  //     );
  //     if (response.statusCode == 200) {
  //       Map<String, dynamic> data = jsonDecode(response.body);
  //       String content = data['choices'][0]['message']['content'];
  //       var result = jsonDecode(content);
  //       if (result is List<dynamic>) {
  //         return result;
  //       } else {
  //         throw Exception('Failed to load response : ${response.statusCode}');
  //       }
  //     } else {
  //       throw Exception('Failed to load response : ${response.statusCode}');
  //     }
  //   } catch (e) {
  //     Logger().e(e);
  //     throw Exception('An error occurred while processing the request');
  //   }
  // }
}
