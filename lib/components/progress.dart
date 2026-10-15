import 'package:flutter/material.dart';
import 'package:uikitty/uikitty.dart';

/*
    15-10-2026
    juzuk1q#1001
    отвечает за прогресс бар
 */
class ProgressBar extends StatefulWidget {
  final int steps;        // всего шагов
  final int step;         // нынешний шаг

  const ProgressBar({super.key, required this.steps, required this.step});

  @override
  State<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends State<ProgressBar> {


  Color _color(int index) {
    final stepN = index + 1;

    if (stepN < widget.step) {
      return AppColor.primary;
    } else if (stepN == widget.step) {
      return AppColor.secondary;
    } else return AppColor.grey;
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(widget.steps, (indx) {
        final color = _color(indx);
        return Expanded(child: _item(color));
      }),
    );
  }

  Widget _item(Color color) {
    return Container(
      margin: ps(h: 2.fw),
      height: 8.fh,
      width: double.infinity,
      decoration: BoxDecoration(
        color: color,
        borderRadius: .circular(999999999.r)
      ),
    );
  }
}
