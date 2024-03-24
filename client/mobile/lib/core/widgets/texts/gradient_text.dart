

import 'package:flutter/material.dart';
class GradientText extends StatelessWidget {

  const GradientText({
    super.key,
    required this.text,
    required this.style,
    this.gradient,
    this.color,
  });
  final String text;
  final TextStyle style;
  final Gradient? gradient;
  final Color? color;

  @override
  Widget build(BuildContext context) {
    // グラデーションが指定されている場合
    if (gradient != null) {
      return ShaderMask(
        shaderCallback: (bounds) => gradient!.createShader(
          Rect.fromLTWH(0, 0, bounds.width, bounds.height),
        ),
        child: Text(text, style: style.copyWith(color: Colors.white)),
      );
    }
    // 固定色が指定されている場合
    else if (color != null) {
      return Text(text, style: style.copyWith(color: color));
    }
    // どちらも指定されていない場合はデフォルトのスタイルを使用
    else {
      return Text(text, style: style);
    }
  }
}
