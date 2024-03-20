
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/features/quiz/constants/constants.dart';
import 'package:flutter_app_template/features/quiz/parts/button_part.dart';
import 'package:flutter_app_template/features/quiz/use_cases/quiz_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/exceptions/app_exception.dart';
import '../../app_user/use_case/app_user_controller.dart';
import '../entities/quiz.dart';
import 'explanation_part.dart';

class QuizParts extends HookConsumerWidget {
  const QuizParts({super.key,required this.quizListData});

  final List<Quiz> quizListData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final currentQuizIndex = useState<int>(0);
    final selectButtonIndex = useState<int>(0);
    final isCorrect = useState<bool?>(null);
    final audioPlayer = AudioPlayer();
    useEffect(() {
      final value = isCorrect.value;
      if(value == null) {
        return;
      }
      if(value) {
        audioPlayer.play(AssetSource('sound/correct.mp3'));
      } else {
        audioPlayer.play(AssetSource('sound/incorrect.mp3'));
      }
      return;
    }, [isCorrect.value],);

    if(quizListData.isEmpty || quizListData.length <= currentQuizIndex.value) {
      return const Center(child: CupertinoActivityIndicator());
    }
    return Padding(
      padding: const EdgeInsets.all(15),
      child: SingleChildScrollView(
        child: Column(
          children: [
            Visibility(
              visible: isCorrect.value != null,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                    onPressed: () async {
                      currentQuizIndex.value++;
                      isCorrect.value = null;
                    },
                    child: const Text(
                        '次へ',
                        style: TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                        ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20,),
            if(isCorrect.value == null)
              const SizedBox(height: 50,),
            DecoratedBox(
              decoration: BoxDecoration(
                color: Colors.white.withOpacity(0.35),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                child: Column(
                  children: [
                    if(isCorrect.value != null)
                      _displayResult(isCorrect: isCorrect.value!),
                    Text(quizListData[currentQuizIndex.value].question,style: quizContentTextStyle,),
                  ],
                ),
              )
            ),
            const SizedBox(height: 30,),
            Visibility(
              visible: isCorrect.value == null,
              child: ButtonPart(
                quizIndex: currentQuizIndex,
                isCorrect: isCorrect,
                selectButtonIndex: selectButtonIndex,
                updateUserQuizStatus: () async {
                  final quizState = ref.read(quizControllerProvider);
                  if(quizState is AsyncLoading){
                    return;
                  }
                  await Future.wait([
                    _answeredQuizUpdate(
                      ref: ref,
                      quiz: quizListData[currentQuizIndex.value],
                    ),
                    _usrStateUpdate(
                      ref: ref,
                      quiz: quizListData[currentQuizIndex.value],
                    ),
                  ]);
                  await _fetchMoreQuiz(ref);
                },
              ),
            ),
            Visibility(
              visible: isCorrect.value != null,
              child: DecoratedBox(
                decoration: BoxDecoration(
                  color: Colors.white.withOpacity(0.6),
                  borderRadius: BorderRadius.circular(15),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(10),
                  child: ExplanationPart(
                    quizIndex: currentQuizIndex,
                    selectButtonIndex: selectButtonIndex,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> _answeredQuizUpdate ({
    required WidgetRef ref,
    required Quiz quiz,
  }) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if(userId == null) {
      return;
    }
    final updateQuizData = quiz.copyWith(
      // TODO(yy): ここでcountAnswersを更新する
      //answeredUserIds: quiz.answeredUserIds.contains(userId) ? quiz.answeredUserIds : [...quiz.answeredUserIds,userId],
    );
    await ref.read(quizControllerProvider.notifier).onUpdate(updateQuizData);
  }

  Future<void> _usrStateUpdate ({
    required WidgetRef ref,
    required Quiz quiz,
  }) async {
    final currentUser = await ref.read(appUserControllerProvider.future);
    if(currentUser == null) {
      throw AppException.irregular();
    }
    final updatedUser = currentUser.copyWith(
      answeredQuizIds: [...currentUser.answeredQuizIds,quiz.id],
      lastAnsweredQuizCreatedAt: quiz.createdAt ?? currentUser.lastAnsweredQuizCreatedAt,
    );
    await ref.read(appUserControllerProvider.notifier).onUpdate(updatedUser);
  }



  Future<void> _fetchMoreQuiz(WidgetRef ref) async {
    final quizList = ref.read(quizControllerProvider).asData?.value;
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    final currentUser = await ref.read(appUserControllerProvider.future);
    final lastAnsweredQuizCreatedAt = currentUser?.lastAnsweredQuizCreatedAt;
    if(quizList == null || userId == null || currentUser == null || lastAnsweredQuizCreatedAt == null) {
      throw AppException.irregular();
    }
    final unansweredQuiz = quizList.where((quiz) => quiz.createdAt?.isAfter(lastAnsweredQuizCreatedAt) ?? false).toList();
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


  Widget _displayResult({required bool isCorrect}) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          isCorrect
              ? const Icon(Icons.circle_outlined,color: Colors.red,size: 40,)
              : const Icon(Icons.close_outlined,color: Colors.blue,size: 50,),
          const SizedBox(width: 20,),
          isCorrect
              ? const Text('正解！',style: TextStyle(color: Colors.red,fontSize: 28),)
              : const Text('不正解！',style: TextStyle(color: Colors.blue,fontSize: 28),),
        ],
      ),
    );
  }
}





