import 'package:cs_ui/cs_ui.dart';
import 'package:flutter/material.dart';

class CsTheme {
  static final light = ThemeData.light().copyWith(
    scaffoldBackgroundColor: CsColors.scaffold,
  );
  static final dark = ThemeData.dark().copyWith(
    scaffoldBackgroundColor: const Color(0xFF222222),
  );
}
