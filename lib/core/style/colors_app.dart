import 'package:flutter/material.dart';

class ColorsApp {
  static ColorsApp? _instance;

  ColorsApp._();

  // ignore: prefer_constructors_over_static_methods
  static ColorsApp get instance {
    _instance ??= ColorsApp._();
    return _instance!;
  }

  List<Color> get gradientColor => [Color(0xFFD23C3C), Color(0xFF6C1F1F)];

  Color get primary => const Color(0xFFE1364A);

  Color get primaryDark => const Color(0xFFE02727);

  Color get secondary => const Color(0xFF531491);

  Color get secondaryDark => const Color(0xFF212121);

  Color get errorColor => const Color(0xFFC62828);

  Color get textColor => neutralShade600;

  Color get textColorMedium => neutralShade550;

  Color get textColorLight => neutralShade500;

  Color get supportGreen => const Color(0xFF0C8754);

  Color get supportRed => const Color(0xFFCD3915);

  Color get supportYellow => const Color(0xFFE9C23A);

  Color get supportBlue => const Color(0xFF3B5A9A);

  Color get neutralShade600 => const Color(0xFF1D1D1D);

  Color get neutralShade550 => const Color(0xFF333333);

  Color get neutralShade500 => const Color(0xFF5F5F5F);

  Color get neutralShade400 => const Color(0xFFA3A3A3);

  Color get neutralShade300 => const Color(0xFFCCCCCC);

  Color get neutralShade200 => const Color(0xFFE6E6E6);

  Color get neutralShade150 => const Color(0xFFF1F1F1);

  Color get neutralShade100 => const Color(0xFFF7F7F7);

  Color get neutralWhite => const Color(0xFFFFFFFF);

  Color get backgroundColor => neutralWhite;
}

extension ColorsAppExtension on BuildContext {
  ColorsApp get colors => ColorsApp.instance;
}