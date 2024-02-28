import 'package:flutter_app_template/features/quiz/repositories/quiz_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../entities/quiz.dart';
part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  Future<Quiz> build() async {
    final data = await ref.watch(quizApiRepositoryProvider).fetchQuiz();
    return data;
  }
}
