
import 'package:flutter_app_template/features/quiz/entities/answered_quiz.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/repositories/firebase_auth/firebase_auth_repository.dart';
import '../../../core/repositories/firestore/collection_paging_repository.dart';
import '../constants/constants.dart';
part 'answered_quiz_controller.g.dart';

@Riverpod(keepAlive: true)
CollectionPagingRepository<AnsweredQuiz> quizCollectionPagingRepository(
    QuizCollectionPagingRepositoryRef ref,
    CollectionParam<AnsweredQuiz> query,
    ) {
  return CollectionPagingRepository<AnsweredQuiz>(
    query: query.query,
    initialLimit: query.initialLimit,
    pagingLimit: query.pagingLimit,
    decode: query.decode,
  );
}


@riverpod
class AnsweredQuizController extends _$AnsweredQuizController {

  CollectionPagingRepository<AnsweredQuiz>? _collectionPagingRepository;

  @override
  Future<List<AnsweredQuiz>> build(String userId) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if(userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final repository = ref.watch(
      quizCollectionPagingRepositoryProvider(
        CollectionParam<AnsweredQuiz>(
          query: AnsweredQuiz.colRef(userId).orderBy('createdAt',descending: true),
          pagingLimit: pagingLimitCount,
          initialLimit: initialLimitCount,
          decode: AnsweredQuiz.fromJson,
        ),
      ),
    );
    _collectionPagingRepository = repository;
    final documentList = await repository.fetch();
    final answeredQuizList = documentList.map((document) => document.entity).whereType<AnsweredQuiz>().toList();
    return answeredQuizList;
  }
}