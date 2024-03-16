import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/core/repositories/firestore/document_repository.dart';
import 'package:flutter_app_template/features/quiz/repositories/quiz_api_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/repositories/firestore/collection_paging_repository.dart';
import '../constants/constants.dart';
import '../entities/quiz.dart';
part 'quiz_controller.g.dart';

@Riverpod(keepAlive: true)
CollectionPagingRepository<Quiz> quizCollectionPagingRepository(
    QuizCollectionPagingRepositoryRef ref,
    CollectionParam<Quiz> query,
    ) {
  return CollectionPagingRepository<Quiz>(
    query: query.query,
    initialLimit: query.initialLimit,
    pagingLimit: query.pagingLimit,
    decode: query.decode,
  );
}


@riverpod
class QuizController extends _$QuizController {

  CollectionPagingRepository<Quiz>? _collectionPagingRepository;
  @override
  Future<List<Quiz>> build() async {
    final quizList = await onFetch(isFirstFetch: true);
    if(quizList.isNotEmpty) {
      return quizList;
    }
    final newList = await onCreate(isFirstCreate: true);
    return newList;
  }

  Future<List<Quiz>> onFetch({required bool isFirstFetch}) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final repository = ref.watch(
      quizCollectionPagingRepositoryProvider(
        CollectionParam<Quiz>(
          query: Quiz.colRef,//.where('answeredUserIds', whereNotIn: [userId]),//TODO: 未回答のクイズを取得する
          initialLimit: initialLimitCount,
          pagingLimit: pagingLimitCount,
          decode: Quiz.fromJson,
        ),
      ),
    );
    _collectionPagingRepository = repository;
    final documentList = await repository.fetch();
    final quizList = documentList.map((document) => document.entity).whereType<Quiz>().toList();
    final previousState = isFirstFetch ? <Quiz>[] : await future;
    state = AsyncData([
      ...previousState,
      ...quizList,
    ]);
    return quizList;
  }


  Future<List<Quiz>> onCreate ({required bool isFirstCreate}) async {
    final data = await ref.read(quizApiRepositoryProvider).createQuiz();
    await onSave(data);
    final previousData = isFirstCreate ? <Quiz>[] : await future;
    final dataList = [...previousData,data];
    state = AsyncData(dataList);
    return dataList;
  }

  Future<void> onUpdate (Quiz quiz) async {

    state = await AsyncValue.guard(() async {
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
      return newList;
    });
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
