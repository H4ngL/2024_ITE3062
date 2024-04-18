import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';
import 'package:project1/src/controller/loading_controller.dart';
import 'package:project1/src/controller/palette_controller.dart';
import 'package:project1/src/screens/contents/color_palette.dart';

class ResultPalette extends StatelessWidget {
  ResultPalette({
    super.key,
    this.vertical = false,
  });

  final ScrollController _scrollController = ScrollController();
  final bool vertical;

  @override
  Widget build(BuildContext context) {
    Get.put(PaletteController());
    Get.put(LoadingController());

    return GetX<LoadingController>(
      builder: (loadingController) {
        if (loadingController.isLoading.value) {
          return Container(
            margin: vertical
                ? const EdgeInsets.only(left: 0)
                : const EdgeInsets.only(left: 20),
            constraints: BoxConstraints(minHeight: vertical ? 400 : 0),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              color: Colors.grey[200],
            ),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                LoadingAnimationWidget.threeArchedCircle(
                  color: Colors.grey[400]!,
                  size: 40,
                ),
                const SizedBox(height: 20),
                Text(
                  '팔레트 생성 중...',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.grey[600],
                  ),
                ),
              ],
            ),
          );
        }

        return Container(
          margin: vertical
              ? const EdgeInsets.only(left: 0)
              : const EdgeInsets.only(left: 20),
          constraints: BoxConstraints(minHeight: vertical ? 400 : 0),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            color: Colors.grey[200],
          ),
          child: GetX<PaletteController>(
            builder: (controller) {
              if (controller.colors.isEmpty) {
                return Container(
                  margin: const EdgeInsets.only(left: 20),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(7),
                    color: Colors.grey[200],
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20),
                    child: Center(
                      child: Text(
                        '생성된 팔레트가 없습니다.\n"Generate" 버튼을 눌러 색상 팔레트를 생성하세요.',
                        style: TextStyle(
                          fontSize: 16,
                          color: Colors.grey[600],
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                );
              }
              return Scrollbar(
                controller: _scrollController,
                thumbVisibility: true,
                child: SingleChildScrollView(
                  controller: _scrollController,
                  child: Column(
                    children: [
                      const Padding(
                        padding: EdgeInsets.all(20),
                        child: Text(
                          'Palette',
                          style: TextStyle(
                            fontSize: 24,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              '1. Default Palette',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ColorPalette(colors: controller.colors),
                            const SizedBox(height: 20),
                            Text(
                              '2. Palette with Percentage',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ColorPaletteWithPercentage(
                                colors: controller.colorFeature),
                            const SizedBox(height: 20),
                            Text(
                              '3. Palette with Name',
                              style: TextStyle(
                                fontSize: 18,
                                fontWeight: FontWeight.w500,
                                color: Colors.grey[600],
                              ),
                            ),
                            const SizedBox(height: 20),
                            ColorPaletteWithName(
                                colors: controller.colorFeature),
                            const SizedBox(height: 20),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        );
      },
    );
  }
}
