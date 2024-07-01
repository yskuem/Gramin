


sealed class QuizBattlePageState {
  const QuizBattlePageState();
}

class Initial extends QuizBattlePageState {
  const Initial();
}

class Waiting extends QuizBattlePageState {
  const Waiting();
}

class CountDown extends QuizBattlePageState {
  const CountDown();
}

class Battle extends QuizBattlePageState {
  const Battle();
}
