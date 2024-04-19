import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:project1/src/controller/loading_controller.dart';
import 'package:project1/src/controller/main_type_controller.dart';
import 'package:project1/src/controller/palette_controller.dart';
import 'package:project1/src/controller/screen_layout_controller.dart';
import 'package:project1/src/controller/setting.dart';
import 'package:project1/src/model/gpt_api.dart';
import 'package:project1/src/screens/contents/advanced_settings.dart';
import 'package:project1/src/screens/contents/main_setting.dart';
import 'package:project1/src/screens/contents/result_palette.dart';
import 'package:project1/src/screens/contents/toggle_button.dart';

class Content extends StatefulWidget {
  const Content({
    super.key,
    required this.screenSizeType,
    this.vertical = false,
  });

  final ScreenSizeType screenSizeType;
  final bool vertical;

  @override
  State<Content> createState() => _ContentState();
}

class _ContentState extends State<Content> {
  final ScrollController _scrollController = ScrollController();
  final TextEditingController _textController = TextEditingController();
  bool isAdvancedSettingsEnabled = false;

  @override
  Widget build(BuildContext context) {
    Get.put(PaletteController());
    Get.put(LoadingController());
    Get.put(MainTypeController());
    Settings settings = Settings();

    return Scrollbar(
      controller: _scrollController,
      thumbVisibility: true,
      child: SingleChildScrollView(
        controller: _scrollController,
        child: Padding(
          padding: const EdgeInsets.only(right: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const Text(
                'The Better Color Palette Generator',
                style: TextStyle(
                  fontSize: 32,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),
              Text(
                '우리의 목표는 색상 팔레트 생성을 더욱 편리하게 만드는 것입니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 8),
              Text(
                '요구사항을 입력하고 "Generate" 버튼을 누르면 원하는 색상 팔레트를 생성할 수 있습니다.',
                style: TextStyle(
                  fontSize: 16,
                  color: Colors.grey[600],
                ),
              ),
              const SizedBox(height: 24),
              MainSetting(
                textController: _textController,
              ),
              const SizedBox(height: 24),
              const Text(
                'Sub',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),
              Row(
                children: [
                  ToggleButton(
                    initialValue: isAdvancedSettingsEnabled,
                    onChanged: (value) {
                      setState(() {
                        isAdvancedSettingsEnabled = value;
                      });
                    },
                  ),
                  const SizedBox(width: 8),
                  Text(
                    isAdvancedSettingsEnabled
                        ? '고급 설정을 사용합니다.'
                        : '고급 설정을 사용하지 않습니다.',
                    style: TextStyle(
                      fontSize: 16,
                      color: Colors.grey[600],
                    ),
                  ),
                ],
              ),
              if (isAdvancedSettingsEnabled) ...[
                const SizedBox(height: 8),
                const AdvancedSettings(),
              ],
              const SizedBox(height: 24),
              ElevatedButton(
                onPressed: () {
                  if (!isAdvancedSettingsEnabled) {
                    Get.find<LoadingController>().changeLoadingState(true);
                    MainType type =
                        Get.find<MainTypeController>().mainType.value;
                    GPTApi.getGPTResponse(
                      prompt: _textController.text,
                      type: type,
                    ).then((value) {
                      Get.find<PaletteController>().setColors(value);
                      GPTApi.getColorFeatures(value).then((value) {
                        Get.find<PaletteController>().setColorFeature(value);
                        Get.find<LoadingController>().changeLoadingState(false);
                      });
                    });
                  } else {
                    Get.find<LoadingController>().changeLoadingState(true);
                    MainType type =
                        Get.find<MainTypeController>().mainType.value;
                    GPTApi.getGPTResponse(
                      prompt: _textController.text,
                      type: type,
                      count: settings.colorCount,
                      mix: settings.colorMix,
                      opacity: settings.opacity,
                    ).then((value) {
                      Get.find<PaletteController>().setColors(value);
                      GPTApi.getColorFeatures(value).then((value) {
                        Get.find<PaletteController>().setColorFeature(value);
                        Get.find<LoadingController>().changeLoadingState(false);
                      });
                    });
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(
                    horizontal: 24,
                    vertical: 22,
                  ),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(5),
                  ),
                ),
                child: const Text(
                  'Generate',
                  style: TextStyle(
                    color: Colors.white,
                  ),
                ),
              ),
              if (widget.vertical) const SizedBox(height: 30),
              if (widget.vertical)
                ResultPalette(
                  vertical: true,
                ),
            ],
          ),
        ),
      ),
    );
  }
}
