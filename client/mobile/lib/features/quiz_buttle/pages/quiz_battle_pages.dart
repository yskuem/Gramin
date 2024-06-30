
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz_buttle/pages/waiting_battle_page.dart';
import 'package:flutter_app_template/features/quiz_buttle/use_case/quiz_battle_page_state_controller.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_wrapper/pages/main_page.dart';
import '../entities/quiz_battle_page_state.dart';
import 'battle_initial_page.dart';


class QuizBattlePages extends HookConsumerWidget {
  const QuizBattlePages({super.key});

  static String get pageName => 'battle_quiz';
  static String get pagePath => '${MainPage.pagePath}/$pageName';

  static void push(BuildContext context) {
    context.push(pagePath);
  }


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
