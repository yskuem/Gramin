

import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz_buttle/use_case/quiz_battle_page_state.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/quiz_battle_page_state.dart';

class BattleInitialPage extends HookConsumerWidget {
  const BattleInitialPage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      // ボタンを配置
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            ElevatedButton(
              onPressed: () {
                ref.read(
                    quizBattlePageStateControllerProvider.notifier,
                ).changePageState(nextState: const Waiting());
              },
              child: const Text('はじめる'),
            ),
          ],
        ),
      ),
    );
  }
}