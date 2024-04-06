
import 'package:flutter/material.dart';

import '../../features/ranking/parts/rank_text.dart';

class RankTextStyles {
  RankTextStyles._();
  static Widget rankText(int rank) {
    if(rank == 1) {
      return RankText(
        rank: rank,
        colors: [Colors.amber[700]!, Colors.amber[700]!],
      );
    }
    if(rank == 2) {
      return RankText(
        rank: rank,
        colors: [Colors.grey[700]!, Colors.grey[400]!],
      );
    }
    if(rank == 3) {
      return RankText(
        rank: rank,
        colors: [Colors.brown[600]!, Colors.brown[400]!],
      );
    }
    return Text(
      '$rank',
      style: const TextStyle(
        fontSize: 32,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}




