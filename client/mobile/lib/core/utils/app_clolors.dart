
import 'package:flutter/material.dart';

class AppColors {
  AppColors._();
  static Color getColorFromScore(int score) {
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
}
