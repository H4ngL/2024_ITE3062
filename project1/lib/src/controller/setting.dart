enum ColorMix { analogic, contrast, monochromatic }

class Settings {
  static final Settings _instance = Settings._internal();

  factory Settings() {
    return _instance;
  }

  Settings._internal();

  int colorCount = 6;
  ColorMix colorMix = ColorMix.analogic;
  double opacity = 1.0;

  void setColorCount(int count) {
    colorCount = count;
  }

  void setColorMix(ColorMix mix) {
    colorMix = mix;
  }

  void setOpacity(double value) {
    opacity = value;
  }
}
