

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/user_profile/parts/quiz_score_part.dart';
import 'package:flutter_app_template/features/user_profile/parts/user_ranking_part.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'max_consecutive_correct_part.dart';


class UserResultPart extends HookConsumerWidget {

  const UserResultPart({
    super.key,
    required this.userId,
  });

  final String userId;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.6,
      child: TransparentCard(
          opacity: 0.5,
          child: Column(
            children: [
              UserRankingPart(userId: userId),
              const QuizScorePart(),
              MaxConsecutiveCountPart(userId: userId),
            ],
          )
      ),
    );
  }
}

