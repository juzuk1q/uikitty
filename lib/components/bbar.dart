import 'package:flutter/material.dart';
import 'package:uikitty/uikitty.dart';
import 'package:vize/vize.dart';
import 'package:flutter_svg/flutter_svg.dart';

/*
  15-10-2026
  juzuk1q#1001
  боттомбар, для навигации в приложении
*/

class AppBottomBar extends StatefulWidget {
  final int sIndex;         //выбранный элемент
  final VoidCallback onTap; // действие на кнопку

  const AppBottomBar({super.key, required this.sIndex, required this.onTap});

  @override
  State<AppBottomBar> createState() => _AppBottomBarState();
}

class _AppBottomBarState extends State<AppBottomBar> {
  static const _items = [
    (label: 'Vacancies', icon: 'assets/icon/1.svg'),
    (label: 'Candidates', icon: 'assets/icon/2.svg'),
    (label: 'Settings', icon: 'assets/icon/3.svg'),
  ];

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: po(t: 21),
      width: double.infinity,
      height: 80.fh,
      decoration: BoxDecoration(
        color: AppColor.white,
        borderRadius: .only(topRight: .circular(8.r), topLeft: .circular(8.r)),
        border: .fromLTRB(top: .new(color: AppColor.darkenWhite, width: 1)),
        boxShadow: [
          BoxShadow(color: Color(0xff000000).withValues(alpha: 0.05), offset: Offset(0, -4), blurRadius: 12, spreadRadius: 0)
        ]
      ),
      child: Row(
        mainAxisAlignment: .end,
        children: List.generate(_items.length, (i) {
          final selectd = i == widget.sIndex;
          return Expanded(
            child: GestureDetector(
              onTap: widget.onTap,
              child: Column(
                children: [
              SvgPicture.asset(_items[i].icon, colorFilter: .mode(
                  selectd ? AppColor.primary : AppColor.secondary, .srcIn), package: 'uikitty'),
                Text(_items[i].label, style: AppText.fieldLabel.copyWith(
                    color: selectd
                        ? AppColor.primary
                        : AppColor.secondary)
                ),
                ],
              ),
            ),
          );
        }),
      ),
    );
  }
}

class AppBottomBarJSON extends StatefulWidget {
  final VoidCallback onContinue;      // действие на кнопку продолжить
  final VoidCallback onSave;          // действие на кнопку сохранить
  const AppBottomBarJSON({super.key, required this.onSave, required this.onContinue});

  @override
  State<AppBottomBarJSON> createState() => _AppBottomBarJSONState();
}

class _AppBottomBarJSONState extends State<AppBottomBarJSON> {
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: po(t: 15.5),
      width: double.infinity,
      height: 80.fh,
      decoration: BoxDecoration(
        color: AppColor.white,
        boxShadow: [
          BoxShadow(color: Color(0xff000000).withValues(alpha: 0.05), offset: Offset(0, -4), blurRadius: 12)
        ],
      ),
      child: Row(
        mainAxisAlignment: .center,
        children: [
        GestureDetector(
          onTap: widget.onSave,
          child: Container(
            height: 42.fh,
            width: 125.fw,
            child: Column( crossAxisAlignment: .center,
              children: [Spacer(),SvgPicture.asset('assets/icon/4.svg', package: 'uikitty', colorFilter: .mode(AppColor.secondary, .srcIn)), Text('Сохранить', style: AppText.bodySmall.copyWith(color: AppColor.secondary),), Spacer(),],
            ),
          ),
        ),
        8.fws,
        GestureDetector(
          onTap: widget.onContinue,
          child: Container(
            decoration: BoxDecoration(
              color: AppColor.primary,
              borderRadius: .circular(12.r)
            ),
            height: 48.fh,
            width: 165.fw,
            child: Column(
              children: [
                Spacer(),
                SvgPicture.asset('assets/icon/5.svg',package: 'uikitty', colorFilter: .mode(AppColor.white, .srcIn),), Text('Продолжить', style: AppText.bodySmall.copyWith(color: AppColor.white),),
                Spacer(),
              ],
            ),
          ),
        )
      ],),
    );
  }
}
