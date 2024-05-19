import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/core/repositories/firestore/document_repository.dart';
import 'package:flutter_app_template/core/utils/logger.dart';
import 'package:flutter_app_template/features/quiz/entities/answered_quiz.dart';
import 'package:flutter_app_template/features/quiz/use_cases/answered_quiz_controller.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../../utils.dart';
import 'answered_quiz_controller_test.mocks.dart';

@GenerateNiceMocks(
  [
    MockSpec<DocumentRepository>(),
    MockSpec<FirebaseAuthRepository>(),
  ],
)
void main() {

  // テストで利用する定数を定義
  const quizId = 'testQuizId';
  const userSelectIndex = 1;
  const isCorrect = true;
  const userId = 'testUserId';



  // 前処理（テスト前に1回呼ばれる）
  setUpAll(Logger.configure);

  // 正常系テストケース
  group('[正常系] Saveメソッド オフラインテスト', () {
    late MockDocumentRepository mockDocumentRepository;
    late MockFirebaseAuthRepository mockFirebaseAuthRepository;



    // 前処理（各テスト前に呼ばれる）
    setUp(() {
      mockDocumentRepository = MockDocumentRepository();
      mockFirebaseAuthRepository = MockFirebaseAuthRepository();

      // FirebaseAuthRepositoryのモック設定
    });

    // 後処理（各テスト後に呼ばれる）
    tearDown(() {
      reset(mockDocumentRepository);
      reset(mockFirebaseAuthRepository);
    });

    test('saveメソッドが正常に動作すること', () async {
      when(mockFirebaseAuthRepository.loggedInUserId).thenReturn(userId);

      when(
        mockDocumentRepository.save(
          any,
          data: anyNamed('data'),
        ),
      ).thenAnswer((_) async => Future.value());

      final container = createContainer(
        overrides: [
          documentRepositoryProvider.overrideWithValue(mockDocumentRepository),
          firebaseAuthRepositoryProvider.overrideWithValue(mockFirebaseAuthRepository),
        ],
      );

      await container.read(answeredQuizControllerProvider.notifier).save(
        quizId: quizId,
        userSelectIndex: userSelectIndex,
        isCorrect: isCorrect,
      );

      final expectedPath = AnsweredQuiz.docPath(userId: userId, quizId: quizId);

      verify(
        mockDocumentRepository.save(
          expectedPath,
          data: captureAnyNamed('data'),
        ),
      ).called(1);
    });

    test('userIdがnullの場合に例外がスローされること', () async {
      // userIdがnullを返すようにモックを設定
      when(mockFirebaseAuthRepository.loggedInUserId).thenReturn(null);

      // ProviderにMockをセットする
      final container = createContainer(
        overrides: [
          documentRepositoryProvider.overrideWithValue(mockDocumentRepository),
          firebaseAuthRepositoryProvider.overrideWithValue(mockFirebaseAuthRepository),
        ],
      );

      // 例外がスローされることを検証
      expect(
            () async => container.read(answeredQuizControllerProvider.notifier).save(
          quizId: quizId,
          userSelectIndex: userSelectIndex,
          isCorrect: isCorrect,
        ),
        throwsA(isA<AppException>()),
      );
    });

    test('isCorrectがnullの場合に例外がスローされること', () async {
      // ProviderにMockをセットする
      final container = createContainer(
        overrides: [
          documentRepositoryProvider.overrideWithValue(mockDocumentRepository),
          firebaseAuthRepositoryProvider.overrideWithValue(mockFirebaseAuthRepository),
        ],
      );

      // 例外がスローされることを検証
      expect(
            () async => container.read(answeredQuizControllerProvider.notifier).save(
          quizId: quizId,
          userSelectIndex: userSelectIndex,
          isCorrect: null,
        ),
        throwsA(isA<AppException>()),
      );
    });
  });
}
