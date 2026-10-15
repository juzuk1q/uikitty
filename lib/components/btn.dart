import 'package:flutter/material.dart';
import 'package:uikitty/uikitty.dart';

/*
    date: 15-10-2026
    author: juzuk1q#1001
    отвечает за кнопки
 */

class AppButton extends StatefulWidget {
  final String text;          // текст кнопки
  final VoidCallback onTap;   // вызов действия при нажатии
  final Color? txtColor;      // цвет для текста
  final Color? bgColor;       // цвет для заднего фона
  final Color? strokeColor;   // цвет для обводки
  final bool? isDisabled;     // флаг для блокировки кнопки.

  const AppButton(
      {super.key, required this.text, required this.onTap, this.txtColor = AppColor.white, this.bgColor = AppColor.primary, this.strokeColor = AppColor.primary, this.isDisabled = false});

  @override
  State<AppButton> createState() => _AppButtonState();
}

class _AppButtonState extends State<AppButton> {

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: widget.isDisabled == true ? widget.onTap : null,
      child: Container(
        width: double.infinity,
        height: 48.fh,
        decoration: BoxDecoration(
          color: widget.bgColor!,
          borderRadius: .circular(8),
          border: .all(color: widget.strokeColor!, width: 2)
        ),
        child: Center(child: Text(widget.text, style: AppText.bodyMedium.copyWith(color: widget.txtColor),)),
      ),
    );
  }
}
