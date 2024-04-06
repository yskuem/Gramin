import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/utils/rank_text.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/user_profile/parts/display_user_level_part.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../use_case/ranking_user_controller.dart';




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
    final user = ref.watch(rankingUserControllerProvider).value?[index];
    return SizedBox(
      height: height,
      width: width,
      child: TransparentCard(
          child: Row(
            children: [
              const Spacer(),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  RankTextStyles.rankText(index + 1),
                  DisplayUserLevelPart(
                      userId: user?.authId ?? '',
                  ),
                ],
              ),
              const Spacer(flex: 2,),
              CircleAvatar(
                radius: 25,
                foregroundImage: NetworkImage(user?.iconUrl ?? ''),
              ),
              const Spacer(),
              Text(
                user?.name ?? '',
                style: const TextStyle(
                  fontSize: 18,
                ),
              ),
              const Spacer(flex: 8,),
            ],
          ),
      ),
    );
  }
}



