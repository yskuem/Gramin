import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:collection/collection.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/core/repositories/firestore/document_repository.dart';
import 'package:flutter_app_template/features/app_user/use_case/app_user_controller.dart';
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
    final quizList = await onFetch();
    if(quizList.isNotEmpty) {
      return quizList;
    }
    debugPrint('クイズが存在しないため新規作成します');
    final newList = await onCreate(isFirstCreate: true);
    return newList;
  }

  Future<List<Quiz>> onFetch() async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    final currentUser = await ref.read(appUserControllerProvider.future);
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    if(currentUser == null) {
      throw AppException(title: 'ユーザー情報が取得できませんでした');
    }

    final repository = ref.read(
      quizCollectionPagingRepositoryProvider(
        CollectionParam<Quiz>(
          query: Quiz.colRef.orderBy('createdAt',descending: false),
          initialLimit: initialLimitCount,
          pagingLimit: pagingLimitCount,
          decode: Quiz.fromJson,
        ),
      ),
    );
    _collectionPagingRepository = repository;

    final lastAnsweredQuizDocument = await fetchLastAnsweredQuizDocument(
      currentUser.lastAnsweredQuizId,
    );


    final documentList =
    lastAnsweredQuizDocument == null
        ? await repository.fetch()
        : await repository.fetchMore(startAfterDocument: lastAnsweredQuizDocument);
    final quizList = documentList.map((document) => document.entity).whereType<Quiz>().toList();
    state = AsyncData([
      ...quizList,
    ]);
    return quizList;
  }


  Future<DocumentSnapshot<Map<String, dynamic>>?> fetchLastAnsweredQuizDocument(String quizId) async {
    if(quizId.isEmpty) {
      return null;
    }
    final snap = await FirebaseFirestore.instance.doc(Quiz.docPath(quizId)).get();
    return snap;
  }


  Future<List<Quiz>> onFetchMore() async {
    final repository = _collectionPagingRepository;
    if (repository == null) {
      throw AppException.irregular();
    }

    final data = await repository.fetchMore();
    final previousState = await future;
    final previousQuizIdList = previousState.map((e) => e.id).toList();
    final newQuizList = data.map((e) => e.entity).whereType<Quiz>().where((quiz) => !previousQuizIdList.contains(quiz.id)).toList();

    state = AsyncData([
      ...previousState,
      ...newQuizList,
    ]);
    return newQuizList;
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
        data: quiz.copyWith(
          updatedAt: DateTime.now(),
        ).toJson(),
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
      data: quiz.copyWith(
        createdAt: DateTime.now(),
        updatedAt: DateTime.now(),
      ).toJson(),
    );
  }

  Future<void> answeredQuizUpdate ({
    required Quiz quiz,
    required int selectButtonIndex,
  }) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if(userId == null) {
      return;
    }
    final newCountAnswers = quiz.countAnswers.mapIndexed(
          (index, value) => index == selectButtonIndex ? value + 1 : value,
    ).toList();
    final updateQuizData = quiz.copyWith(
      countAnswers: newCountAnswers,
    );
    await onUpdate(updateQuizData);
  }


  Future<void> fetchMoreQuiz() async {
    final quizList = state.value;
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    final currentUser = await ref.read(appUserControllerProvider.future);
    final lastAnsweredQuiz = quizList?.firstWhere((quiz) => quiz.id == currentUser?.lastAnsweredQuizId);
    final lastAnsweredQuizCreatedAt = lastAnsweredQuiz?.createdAt;
    if(quizList == null || userId == null || currentUser == null || lastAnsweredQuizCreatedAt == null) {
      throw AppException.irregular();
    }
    final unansweredQuiz = quizList.where((quiz) =>
        quiz.createdAt?.isAfter(lastAnsweredQuizCreatedAt) ?? false,
    ).toList();
    debugPrint('残りの問題数 ${unansweredQuiz.length}');
    if(unansweredQuiz.length >= fetchMoreIfBelowThreshold) {//残りの問題数が5問以下かどうか
      return;
    }
    final newList = await ref.read(quizControllerProvider.notifier).onFetchMore();
    debugPrint('fireStoreから${newList.length}問追加');
    if(newList.length < pagingLimitCount) {// firestoreから取得できる問題が10問以下かどうか
      debugPrint('新規問題作成');
      await ref.read(quizControllerProvider.notifier).onCreate(isFirstCreate: false);
    }
  }
}
