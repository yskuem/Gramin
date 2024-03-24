
import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/core/widgets/texts/gradient_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_user/use_case/app_user_controller.dart';

class ProfilePart extends HookConsumerWidget {
  const ProfilePart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appUser = ref.watch(appUserControllerProvider);
    final level = _calcUserLevel(userExp: appUser.value?.exPoint ?? 0);
    final levelColor = _getColorFromScore(level);
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TransparentCard(
          opacity: 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        foregroundImage: NetworkImage(appUser.value?.iconUrl ?? ''),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appUser.value?.name ?? '',style: const TextStyle(fontSize: 20),),
                        Text(
                          '@${appUser.value?.displayId}',
                          style: const TextStyle(
                              fontSize: 15,color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    _displayLevel(level: level,levelColor: levelColor),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(appUser.value?.description ?? '',style: const TextStyle(fontSize: 15),),
              ],
            ),
          ),
      ),
    );
  }
  int _calcUserLevel({required int userExp}) {
    if(userExp <= 0) {
      return 0;
    }
    final sqrtNumber = sqrt(userExp);
    final level = sqrtNumber.floor();
    return level;
  }

  Color _getColorFromScore(int score) {
    if (score <= 10) {
      return const Color(0xFF4B0082); // インディゴ
    }
    if (score <= 20) {
      return const Color(0xFF0000FF); // ブルー
    }
    if (score <= 30) {
      return const Color(0xFF007FFF); // アズール
    }
    if (score <= 40) {
      return const Color(0xFF00CCCC); // シアン
    }
    if (score <= 50) {
      return const Color(0xFF008B45); // ダークシーグリーン
    }
    if (score <= 60) {
      return const Color(0xFF008000); // ダークグリーン
    }
    if (score <= 70) {
      return const Color(0xFFB8860B); // ダークゴールドロッド
    }
    if (score <= 80) {
      return const Color(0xFFccaa00); // ダークイエロー
    }
    return const Color(0xFFFF4500); // レッドオレンジ
  }

  Widget _displayLevel({required int level, required Color levelColor}) {
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
