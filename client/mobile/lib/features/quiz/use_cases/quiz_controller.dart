import 'package:flutter_app_template/features/quiz/repositories/quiz_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../entities/quiz.dart';
part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  @override
  Future<Quiz> build() async {
    final quiz = await onCreate();
    return quiz;
  }

  Future<Quiz> onCreate () async {
    final data = await ref.read(quizApiRepositoryProvider).createQuiz();
    return data;
  }

  Future<void> onSave (Quiz quiz) async {
    await ref.read(quizApiRepositoryProvider).saveQuiz(quiz);
  }
}
