import 'package:flutter/material.dart';
import 'package:uikitty/uikitty.dart';

class AppText {
  /*
      дата создания: 15-10-2026
      автор: juzuk1q#1001
      используемые шрифты
   */
  static TextStyle base(FontWeight w, double fs, double lS) =>
      TextStyle(
        fontWeight: w,
        fontSize: fs,
        fontFamily: 'Manrope',
        letterSpacing: lS,
        color: AppColor.black
      );

  static TextStyle get screenHeader => base(.w700, 24, -0.48);
  static TextStyle get subheader => base(.w600, 18, -0.18);
  static TextStyle get bodyMedium => base(.w400, 16, 0);
  static TextStyle get bodySmall => base(.w400, 14, 0);
  static TextStyle get fieldLabel => base(.w600, 14, 0);
}
