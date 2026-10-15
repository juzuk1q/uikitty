import 'package:flutter/material.dart';
import 'package:uikitty/uikitty.dart';
import 'package:vize/vize.dart';
import 'package:flutter_svg/flutter_svg.dart';
/*
    15-10-2026
    juzuk1q#1001
    виджет для поля ввода текста, пароля и поиска
 */

class AppInput extends StatefulWidget {
  final String? label;                        // текст над полем
  final TextEditingController? controller;    // контроллер
  final String? hintText;                     // текст внутри поля
  final Color stateColor;                     // цвет (состояние)
  final bool isDisabled;                      // флаг для блокировки
  final Color txtColor;                       // цвет для текста в поле
  final bool prefI;                           // поиск
  final bool suffI;                           // глазик (пароль)

  const AppInput({
    super.key,
    required this.stateColor,
    this.controller,
    this.label = 'Default Input',
    this.txtColor = AppColor.secondary,
    this.hintText = 'Enter text...',
    this.isDisabled = false,
    this.prefI = false,
    this.suffI = false,
  });

  @override
  State<AppInput> createState() => _AppInputState();
}

class _AppInputState extends State<AppInput> {
  @override
  Widget build(BuildContext context) {
    final border = OutlineInputBorder(
      borderSide: BorderSide(color: widget.stateColor, width: 1),
      borderRadius: .circular(8.r),
    );

    return Column(
      crossAxisAlignment: .start,
      children: [
        Text(
          widget.label!,
          style: AppText.bodySmall.copyWith(
            color: widget.stateColor,
            fontWeight: .w600,
          ),
        ),
        4.5.fhs,
        TextField(
          controller: widget.controller,
          style: AppText.bodyMedium.copyWith(color: widget.txtColor),
          decoration: InputDecoration(
            enabled: !widget.isDisabled,
            filled: true,
            fillColor: AppColor.darkenWhite,
            hintText: widget.hintText,
            border: border,
            enabledBorder: border,
            focusedBorder: border,
            errorBorder: border,
            disabledBorder: border,
            suffixIcon: widget.suffI == true ? suffixIcon() : null,
            prefixIcon: widget.prefI == true ? prefixIcon() : null,
          ),
        ),
      ],
    );
  }
  
  Widget suffixIcon() {
    return Container(
      padding: pa(10),
      height: 15.fh,
      width: 22.fw,
      child: SvgPicture.asset('assets/icon/eye.svg', package: 'uikitty',),
    );
  }
  
  Widget prefixIcon() {
    return Container(
      padding: pa(10),
      height: 18.fh,
      width: 18.fw,
      child: SvgPicture.asset('assets/icon/search.svg', package: 'uikitty',),
    );
  }
}
