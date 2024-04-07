import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/utils/rank_text.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../use_cases/user_ranking_controller.dart';

class UserRankingPart extends HookConsumerWidget {

  const UserRankingPart({
    super.key,
    required this.userId,
  });
  final String userId;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final allUserCount = ref.watch(fetchAllUserCountProvider).value ?? 0;
    final userRanking = ref.watch(fetchUserRankingProvider(userId: userId)).value ?? 0;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          const Text('Ranking',style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold)),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              RankTextStyles.rankText(userRanking),
              const SizedBox(width: 15),
              const Text(
                '/',
                style: TextStyle(
                  fontSize: 25,
                ),
              ),
              const SizedBox(width: 15),
              Text(
                '$allUserCount',
                style: const TextStyle(
                  fontSize: 27,
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
