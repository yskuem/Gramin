
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
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(10),
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
                        final quizState = ref.read(quizControllerProvider);
                        if(quizState is AsyncLoading){
                          return;
                        }
                        currentQuizIndex.value++;
                        isCorrect.value = null;
                        await _answeredUserIdUpdate(
                            ref: ref,
                            quiz: quizListData[currentQuizIndex.value],
                        );
                        await _fetchMoreQuiz(ref);

                      },
                      child: const Text('次へ'),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10,),
              if(isCorrect.value == null)
                const SizedBox(height: 50,),
              if(isCorrect.value != null)
                _displayResult(isCorrect: isCorrect.value!),
              Text(quizListData[currentQuizIndex.value].question,style: quizContentTextStyle,),
              const SizedBox(height: 50,),
              Visibility(
                  visible: isCorrect.value == null,
                  child: ButtonPart(
                      quizIndex: currentQuizIndex,
                      isCorrect: isCorrect,
                      selectButtonIndex: selectButtonIndex,
                  ),
              ),
              Visibility(
                visible: isCorrect.value != null,
                child: ExplanationPart(
                  quizIndex: currentQuizIndex,
                  selectButtonIndex: selectButtonIndex,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> _fetchMoreQuiz(WidgetRef ref) async {
    final quizList = ref.read(quizControllerProvider).asData?.value;
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if(quizList == null || userId == null) {
      throw AppException.irregular();
    }
    final unansweredQuiz = quizList.where((quiz) => !quiz.answeredUserIds.contains(userId)).toList();
    debugPrint('残りの問題数 ${unansweredQuiz.length}');
    if(unansweredQuiz.length >= fetchMoreIfBelowThreshold) {
      return;
    }
    final newList = await ref.read(quizControllerProvider.notifier).onFetch(isFirstFetch: false);
    debugPrint('fireStoreから${newList.length}問追加');
    if(newList.length < pagingLimitCount) {
      debugPrint('新規問題作成');
      await ref.read(quizControllerProvider.notifier).onCreate(isFirstCreate: false);
    }
  }

  Future<void> _answeredUserIdUpdate ({
    required WidgetRef ref,
    required Quiz quiz,
  }) async {
    final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
    if(userId == null) {
      return;
    }
    final updateQuizData = quiz.copyWith(
      answeredUserIds: quiz.answeredUserIds.contains(userId) ? quiz.answeredUserIds : [...quiz.answeredUserIds,userId],
    );
    await ref.read(quizControllerProvider.notifier).onUpdate(updateQuizData);
  }

  Widget _displayResult({required bool isCorrect}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        isCorrect
            ? const Icon(Icons.circle_outlined,color: Colors.red,size: 40,)
            : const Icon(Icons.close_outlined,color: Colors.blue,size: 50,),
        const SizedBox(width: 20,),
        isCorrect
            ? const Text('正解！',style: TextStyle(color: Colors.red,fontSize: 25),)
            : const Text('不正解！',style: TextStyle(color: Colors.blue,fontSize: 25),),
      ],
    );
  }
}

