import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';
// import 'package:google_fonts/google_fonts.dart';

class CsTextStyle {
  static const TextStyle _textStyle = TextStyle(
    color: CsColors.primaryText,
    fontWeight: CsFontWeight.regular,
  );

  /// Headline 1 Text Style
  static TextStyle get headline1 {
    return _textStyle.copyWith(
      fontSize: 56,
      fontWeight: CsFontWeight.medium,
    );
  }

  /// Headline 2 Text Style
  static TextStyle get headline2 {
    return _textStyle.copyWith(
      fontSize: 30,
      fontWeight: CsFontWeight.regular,
    );
  }

  /// Headline 3 Text Style
  static TextStyle get headline3 {
    return _textStyle.copyWith(
      fontSize: 24,
      fontWeight: CsFontWeight.regular,
    );
  }

  /// Headline 4 Text Style
  static TextStyle get headline4 {
    return _textStyle.copyWith(
      fontSize: 22,
      fontWeight: CsFontWeight.bold,
    );
  }

  /// Headline 5 Text Style
  static TextStyle get headline5 {
    return _textStyle.copyWith(
      fontSize: 22,
      fontWeight: CsFontWeight.medium,
    );
  }

  /// Headline 6 Text Style
  static TextStyle get headline6 {
    return _textStyle.copyWith(
      fontSize: 20,
      fontWeight: CsFontWeight.medium,
    );
  }

  /// Subtitle 1 Text Style
  static TextStyle get subtitle1 {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: CsFontWeight.bold,
    );
  }

  /// Subtitle 2 Text Style
  static TextStyle get subtitle2 {
    return _textStyle.copyWith(
      fontSize: 14,
      fontWeight: CsFontWeight.bold,
    );
  }

  /// Body Text 1 Text Style
  static TextStyle get bodyText1 {
    return _textStyle.copyWith(
      fontSize: 18,
      fontWeight: CsFontWeight.medium,
    );
  }

  /// Body Text 2 Text Style (the default)
  static TextStyle get bodyText2 {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: CsFontWeight.regular,
    );
  }

  /// Caption Text Style
  static TextStyle get caption {
    return _textStyle.copyWith(
      fontSize: 14,
      fontWeight: CsFontWeight.regular,
    );
  }

  /// Overline Text Style
  static TextStyle get overline {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: CsFontWeight.regular,
    );
  }

  /// Button Text Style
  static TextStyle get button {
    return _textStyle.copyWith(
      fontSize: 18,
      fontWeight: CsFontWeight.medium,
    );
  }

  /// Text Button Text Style
  static TextStyle get textButton {
    return _textStyle.copyWith(
      fontSize: 16,
      fontWeight: CsFontWeight.medium,
    );
  }

  ///Big Text
  static TextStyle get bigText => _textStyle.copyWith(
        fontSize: 27,
        fontWeight: CsFontWeight.black,
      );

  ///Small Text
  static TextStyle get smallText => _textStyle.copyWith(
        fontSize: 14,
        fontWeight: CsFontWeight.regular,
      );
}
