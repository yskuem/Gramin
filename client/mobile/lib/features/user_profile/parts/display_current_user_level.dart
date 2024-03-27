

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/texts/gradient_text.dart';
import 'package:flutter_app_template/features/app_user/use_case/app_user_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/utils/app_clolors.dart';

class DisplayCurrentUserLevel extends HookConsumerWidget {
  const DisplayCurrentUserLevel({
    super.key,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final user = ref.watch(appUserControllerProvider).value;
    final level = user?.calcUserLevel ?? 0;
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









