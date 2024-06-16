
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz_buttle/pages/waiting_battle_page.dart';
import 'package:flutter_app_template/features/quiz_buttle/use_case/quiz_battle_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/quiz_battle_page_state.dart';
import 'battle_initial_page.dart';


class QuizBattlePages extends HookConsumerWidget {
  const QuizBattlePages({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final pageState = ref.watch(quizBattlePageStateControllerProvider);

    return switch(pageState) {
      Initial() => const BattleInitialPage(),
      Waiting() => const WaitingBattlePage(),
      CountDown() => const BattleInitialPage(),
      Battle() => const BattleInitialPage(),
    };
  }
}
