import 'package:flutter/material.dart';
import 'package:flutter_colorpicker/flutter_colorpicker.dart';
import 'package:get/get.dart';
import 'package:project1/src/controller/main_type_controller.dart';
import 'package:project1/src/firebase/firestore.dart';
import 'package:project1/src/screens/contents/custom_dropdown.dart';

class MainSetting extends StatefulWidget {
  const MainSetting({
    super.key,
    required this.textController,
  });

  final TextEditingController textController;

  @override
  State<MainSetting> createState() => _MainSettingState();
}

class _MainSettingState extends State<MainSetting> {
  Color _color = Colors.blue;

  Widget _promptLayout() {
    return Expanded(
      child: SizedBox(
        height: 52,
        child: TextFormField(
          controller: widget.textController,
          decoration: InputDecoration(
            hintText: '색상을 추천받고 싶은 주제를 입력하세요',
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
      ),
    );
  }

  Widget _colorLayout() {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (_) => Dialog(
            child: Stack(
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    mainAxisSize: MainAxisSize.min,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(8.0),
                        child: Text(
                          '색상 선택',
                          style: TextStyle(
                              fontSize: 18, fontWeight: FontWeight.bold),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Container(
                          constraints: const BoxConstraints(
                              maxWidth: 600, maxHeight: 250),
                          child: HueRingPicker(
                            pickerColor: _color,
                            onColorChanged: (color) {
                              setState(() {
                                _color = color;
                                widget.textController.text =
                                    '#${color.value.toRadixString(16).substring(2)}';
                              });
                            },
                            enableAlpha: false,
                            displayThumbColor: true,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
                Positioned(
                  right: 5,
                  top: 5,
                  child: IconButton(
                    icon: const Icon(Icons.close),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                ),
              ],
            ),
          ),
        );
      },
      hoverColor: Colors.transparent,
      splashColor: Colors.transparent,
      focusColor: Colors.transparent,
      child: Container(
        height: 50,
        width: 100,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(5),
          border: Border.all(
            color: Colors.grey[400]!,
          ),
          color: _color,
        ),
      ),
    );
  }

  Widget _codeLayout() {
    return SizedBox(
      height: 52,
      child: TextFormField(
        controller: widget.textController,
        decoration: InputDecoration(
          constraints: const BoxConstraints(maxWidth: 180),
          hintText: '색상 코드를 입력하세요',
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: Colors.grey[400]!,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: BorderSide(
              color: _isValidColorCode(widget.textController.text)
                  ? Colors.blue
                  : Colors.red,
            ),
          ),
        ),
        onChanged: (value) {
          setState(() {});
        },
        style: TextStyle(
            color: _isValidColorCode(widget.textController.text)
                ? Colors.black
                : Colors.red),
      ),
    );
  }

  bool _isValidColorCode(String value) {
    final validColorRegExp = RegExp(r'^#[0-9a-fA-F]{6}$');
    return validColorRegExp.hasMatch(value);
  }

  @override
  Widget build(BuildContext context) {
    Get.put(MainTypeController());
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text.rich(
          TextSpan(
            children: [
              TextSpan(
                text: 'Main ',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              TextSpan(
                text: '*',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.red,
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 8),
        Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            CustomDropdown(
              items: const ['프롬프트', '중심 색상', '색상 코드'],
              onChanged: (value) {
                widget.textController.clear();
                Get.find<MainTypeController>().changeMainType(stm[value]!);
                if (value == '중심 색상') {
                  widget.textController.text = '#2196F3';
                }
                Firestore.logMainType(value);
              },
              width: 150,
              height: 52,
            ),
            const SizedBox(width: 5),
            GetX<MainTypeController>(
              builder: (controller) {
                switch (controller.mainType.value) {
                  case MainType.prompt:
                    return _promptLayout();
                  case MainType.color:
                    return _colorLayout();
                  case MainType.code:
                    return _codeLayout();
                  default:
                    return Container();
                }
              },
            ),
          ],
        ),
      ],
    );
  }
}
