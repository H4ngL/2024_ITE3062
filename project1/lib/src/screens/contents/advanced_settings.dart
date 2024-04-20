import 'package:flutter/material.dart';
import 'package:project1/src/controller/setting.dart';
import 'package:project1/src/firebase/firestore.dart';
import 'package:syncfusion_flutter_sliders/sliders.dart';

class AdvancedSettings extends StatefulWidget {
  const AdvancedSettings({super.key});

  @override
  State<AdvancedSettings> createState() => _AdvancedSettingsState();
}

class _AdvancedSettingsState extends State<AdvancedSettings> {
  @override
  Widget build(BuildContext context) {
    Settings settings = Settings();

    return Container(
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey[400]!,
          width: 1,
        ),
        borderRadius: BorderRadius.circular(5),
      ),
      padding: const EdgeInsets.all(15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          const Text(
            '색상 개수',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          SfSlider(
            value: settings.colorCount,
            onChanged: (value) {
              setState(() {
                settings.setColorCount(value.toInt());
              });
            },
            onChangeEnd: (value) {
              Firestore.logAdvancedSettingsColorCount(value.toInt());
            },
            min: 2,
            max: 10,
            stepSize: 1,
            showTicks: true,
            showLabels: true,
            interval: 1,
            enableTooltip: true,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[400]!,
          ),
          const SizedBox(height: 20),
          const Text(
            '색상 배합',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: RadioListTile<ColorMix>(
                  title: const Text('유사'),
                  value: ColorMix.analogic,
                  groupValue: settings.colorMix,
                  onChanged: (ColorMix? value) {
                    setState(() {
                      settings.setColorMix(value!);
                    });
                    Firestore.logAdvancedSettingsColorMix(value!);
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<ColorMix>(
                  title: const Text('대비'),
                  value: ColorMix.contrast,
                  groupValue: settings.colorMix,
                  onChanged: (ColorMix? value) {
                    setState(() {
                      settings.setColorMix(value!);
                      Firestore.logAdvancedSettingsColorMix(value);
                    });
                  },
                ),
              ),
              Expanded(
                child: RadioListTile<ColorMix>(
                  title: const Text('단색'),
                  value: ColorMix.monochromatic,
                  groupValue: settings.colorMix,
                  onChanged: (ColorMix? value) {
                    setState(() {
                      settings.setColorMix(value!);
                      Firestore.logAdvancedSettingsColorMix(value);
                    });
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 20),
          const Text(
            '투명도',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 10),
          SfSlider(
            value: settings.opacity * 100,
            onChanged: (value) {
              setState(() {
                settings.setOpacity(value / 100);
              });
            },
            onChangeEnd: (value) {
              Firestore.logAdvancedSettingsOpacity(value / 100);
            },
            min: 0,
            max: 100,
            stepSize: 1,
            showTicks: true,
            showLabels: true,
            interval: 10,
            enableTooltip: true,
            activeColor: Colors.blue,
            inactiveColor: Colors.grey[400]!,
          ),
          const SizedBox(height: 20),
        ],
      ),
    );
  }
}
