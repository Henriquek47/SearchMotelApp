import 'package:flutter/material.dart';
import 'package:guia_motel/core/responsive/responsive_extension.dart';
import 'package:guia_motel/core/style/colors_app.dart';

class TextStyles {
  static TextStyles? _instance;

  TextStyles._();

  static TextStyles get instance {
    _instance ??= TextStyles._();
    return _instance!;
  }

  static const String montserratAlternates = 'MontserratAlternates';

  String get fontMontserratAlternates => 'MontserratAlternates';

  Color get _getTextColor => ColorsApp.instance.neutralShade550;

  Color get _getTextColorGrey => ColorsApp.instance.neutralShade400;

  TextStyle get headingTitleBold => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: fontMontserratAlternates,
        fontSize: 21.appFont,
        color:
            _getTextColor 
      );

  TextStyle get headingTitleSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontMontserratAlternates,
        fontSize: 21.appFont,
        color:
            _getTextColor
      );

  TextStyle get headingAppBarScreen => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontMontserratAlternates,
        fontSize: 17.appFont,
        color:
            _getTextColor
      );

  TextStyle get titleBodyBold => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: fontMontserratAlternates,
        fontSize: 19.appFont,
        color:
            _getTextColor
      );

  TextStyle get secondaryText => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );

  TextStyle get bodyTextLight => TextStyle(
        fontWeight: FontWeight.w300,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );

  TextStyle get bodyText => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );
  TextStyle get bodyTextDescription => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color: _getTextColorGrey
      );

  TextStyle get bodyTextMedium => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );

  TextStyle get bodyTextBold => TextStyle(
        fontWeight: FontWeight.w700,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );

  TextStyle get bodyTextSemiBold => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );

  TextStyle get buttonText => TextStyle(
        fontWeight: FontWeight.w600,
        fontFamily: fontMontserratAlternates,
        fontSize: 15.appFont,
        color:
            _getTextColor
      );

  TextStyle get caption => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontMontserratAlternates,
        fontSize: 12.appFont,
        color:
            _getTextColor
      );

  TextStyle get infoText => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontMontserratAlternates,
        fontSize: 13.appFont,
        height: 1.3,
        color:
            _getTextColor
      );

  TextStyle get link => TextStyle(
        fontWeight: FontWeight.w400,
        fontFamily: fontMontserratAlternates,
        fontSize: 12.appFont,
        decoration: TextDecoration.underline,
        color: ColorsApp.instance.primary,
      );
}

extension TextStylesExtension on BuildContext {
  TextStyles get textStyles => TextStyles.instance;
}
