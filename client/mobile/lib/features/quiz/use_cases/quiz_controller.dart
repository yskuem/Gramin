import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/core/repositories/firestore/document_repository.dart';
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
    state = await AsyncValue.guard(() async {
      final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
      if (userId == null) {
        throw AppException(title: 'ログインしてください');
      }

      await ref.read(documentRepositoryProvider).save(
        Quiz.docPath(quiz.id),
        data: quiz.toDoc,
      );
      return quiz;
    });
  }
}
