

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/texts/gradient_text.dart';

import '../utils/app_clolors.dart';

class DisplayLevel extends StatelessWidget {
  const DisplayLevel({
    super.key,
    required this.level,
  });

  final int level;

  @override
  Widget build(BuildContext context) {
    final levelColor = AppColors.getColorFromScore(level);
    if(level > 90) {
      return Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const GradientText(
            style: TextStyle(fontSize: 22),
            text: 'Level: ',
            gradient: LinearGradient(
              colors: [
                Color(0xFF0000FF), // グラデーションの開始色
                Color(0xFFF5576C), // グラデーションの終了色
              ],
            ),
          ),
          GradientText(
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 22,
            ),
            text: '$level',
            gradient: const LinearGradient(
              colors: [
                Color(0xFFF093FB), // グラデーションの開始色
                Color(0xFFF5576C), // グラデーションの終了色
              ],
            ),
          ),
        ],
      );
    } else {
      return RichText(
        text: TextSpan(
          style: TextStyle(fontSize: 22, color: levelColor), // デフォルトのテキストスタイル
          children: <TextSpan>[
            const TextSpan(text: 'Level: '), // 変更しないテキスト部分
            TextSpan(
              text: '$level', // 太字にしたい部分
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 22,
                color: levelColor,
              ), // 太字スタイルの適用
            ),
          ],
        ),
      );
    }
  }
}







