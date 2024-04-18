import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class ColorPalette extends StatelessWidget {
  final List<String> colors;

  const ColorPalette({Key? key, required this.colors}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: colors.map((color) {
          return InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: color));
              final snackBar = SnackBar(
                width: 400,
                content:
                    Text('$color가 클립보드에 복사되었습니다', textAlign: TextAlign.center),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(milliseconds: 500),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              width: 420 / colors.length - 4,
              height: 75,
              decoration: BoxDecoration(
                color: HexColor(color),
                borderRadius: BorderRadius.circular(5),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ColorPaletteWithPercentage extends StatelessWidget {
  final List colors;

  const ColorPaletteWithPercentage({Key? key, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: Wrap(
        spacing: 4.0,
        runSpacing: 4.0,
        children: colors.map((color) {
          final String hexColor = color['color'];
          final double percentage = color['percentage'];

          return InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: hexColor));
              final snackBar = SnackBar(
                width: 400,
                content: Text('$hexColor가 클립보드에 복사되었습니다',
                    textAlign: TextAlign.center),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(milliseconds: 500),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              width: 420 * percentage / 100 - 4,
              height: 75,
              decoration: BoxDecoration(
                color: HexColor(hexColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  '${percentage.toStringAsFixed(0)}%',
                  style: TextStyle(
                    color:
                        (hexColor == "#ffffff") ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class ColorPaletteWithName extends StatelessWidget {
  final List colors;

  const ColorPaletteWithName({Key? key, required this.colors})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 420,
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: colors.map((color) {
          final String hexColor = color['color'];
          final String name = color['role'];

          return InkWell(
            onTap: () {
              Clipboard.setData(ClipboardData(text: hexColor));
              final snackBar = SnackBar(
                width: 400,
                content: Text('$hexColor가 클립보드에 복사되었습니다',
                    textAlign: TextAlign.center),
                behavior: SnackBarBehavior.floating,
                duration: const Duration(milliseconds: 500),
              );
              ScaffoldMessenger.of(context).showSnackBar(snackBar);
            },
            child: Container(
              height: 50,
              decoration: BoxDecoration(
                color: HexColor(hexColor),
                borderRadius: BorderRadius.circular(5),
              ),
              child: Center(
                child: Text(
                  name,
                  style: TextStyle(
                    color:
                        (hexColor == "#ffffff") ? Colors.black : Colors.white,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          );
        }).toList(),
      ),
    );
  }
}

class HexColor extends Color {
  static int _getColorFromHex(String hexColor) {
    hexColor = hexColor.toUpperCase().replaceAll('#', '');
    if (hexColor.length == 6) {
      hexColor = 'FF$hexColor';
    }
    return int.parse(hexColor, radix: 16);
  }

  HexColor(final String hexColor) : super(_getColorFromHex(hexColor));
}
