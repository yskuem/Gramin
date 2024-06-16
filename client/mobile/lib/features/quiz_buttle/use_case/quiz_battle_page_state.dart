
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../entities/quiz_battle_page_state.dart';
part 'quiz_battle_page_state.g.dart';



@riverpod
class QuizBattlePageStateController extends _$QuizBattlePageStateController {
  @override
  QuizBattlePageState build() {
    return const Initial();
  }

  void changePageState({
    required QuizBattlePageState nextState,
  }) {
    state = nextState;
  }
}
