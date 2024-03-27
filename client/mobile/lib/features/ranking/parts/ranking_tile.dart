
import 'dart:ffi';
import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/ranking/parts/display_ranking_user_level.dart';
import 'package:flutter_app_template/features/user_profile/parts/display_current_user_level.dart';
import 'package:flutter_app_template/features/ranking/parts/rank_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../use_case/ranking_controller.dart';




class RankingTile extends HookConsumerWidget {
  const RankingTile({
    super.key,
    required this.index,
    required this.height,
    required this.width,
  });


  final int index;
  final double height;
  final double width;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final rankingUsers = ref.watch(rankingControllerProvider);
    return SizedBox(
      height: height,
      width: width,
      child: TransparentCard(
          child: Row(
            children: [
              const Spacer(flex: 2),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  _rankText(),
                  DisplayRankingUserLevel(
                      userId: rankingUsers.value?[index].authId ?? '',
                  )
                ],
              ),
              const Spacer(),
              Text(rankingUsers.value?[index].name ?? ''),
              const Spacer(flex: 8,),
            ],
          ),
      ),
    );
  }

  Widget _rankText() {
    final rank = index + 1;
    if(rank == 1) {
      return RankText(
        rank: rank,
        colors: [Colors.amber[700]!, Colors.amber[400]!],
      );
    }
    if(rank == 2) {
      return RankText(
        rank: rank,
        colors: [Colors.grey[600]!, Colors.grey[400]!],
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
