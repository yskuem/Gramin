import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/core/repositories/firestore/document_repository.dart';
import 'package:flutter_app_template/features/quiz/repositories/quiz_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/repositories/firestore/collection_paging_repository.dart';
import '../entities/quiz.dart';
part 'quiz_controller.g.dart';

@riverpod
class QuizController extends _$QuizController {
  static const initialLimitCount = 10;
  static const pagingLimitCount = 10;
  @override
  Future<List<Quiz>> build() async {
    final quizList = await onFetch(isFirstFetch: true);
    return quizList;
  }

  Future<List<Quiz>> onFetch({required bool isFirstFetch}) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final documentList = await CollectionPagingRepository<Quiz>(
      query: Quiz.unansweredQuizListRef(userId),
      initialLimit: initialLimitCount,
      pagingLimit: pagingLimitCount,
      decode: Quiz.fromJson,
    ).fetch();
    final quizList = documentList.map((document) => document.entity).whereType<Quiz>().toList();
    final previousState = isFirstFetch ? <Quiz>[] : await future;
    state = AsyncData([
      ...previousState,
      ...quizList,
    ]);
    return quizList;
  }

  Future<void> onCreate () async {
    state = await AsyncValue.guard(() async {
      final data = await ref.read(quizApiRepositoryProvider).createQuiz();
      await onSave(data);
      final previousData = await future;
      return [...previousData,data];
    });
  }

  Future<void> onUpdate (Quiz quiz) async {
    await ref.read(documentRepositoryProvider).update(
        Quiz.docPath(quiz.id),
        data: quiz.toDoc,
    );
    final previousData = await future;
    final newList = previousData.map((data) {
      if(data.id == quiz.id) {
        return quiz;
      }
      return data;
    }).toList();
    state = AsyncData(newList);
  }

  Future<void> onSave (Quiz quiz) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    await ref.read(documentRepositoryProvider).save(
      Quiz.docPath(quiz.id),
      data: quiz.toDoc,
    );
  }
}
