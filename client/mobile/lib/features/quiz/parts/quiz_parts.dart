import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/advertisement/parts/banner_ad.dart';
import 'package:flutter_app_template/features/quiz/constants/constants.dart';
import 'package:flutter_app_template/features/quiz/parts/button_part.dart';
import 'package:flutter_app_template/features/quiz/use_cases/answered_quiz_controller.dart';
import 'package:flutter_app_template/features/quiz/use_cases/quiz_controller.dart';
import 'package:flutter_app_template/features/ranking/use_case/ranking_user_controller.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/widgets/buttons/quiz_loading_animation.dart';
import '../../advertisement/use_case/interstitial_ad_controller.dart';
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
    final interstitialAd = ref.watch(interstitialAdControllerProvider);
    final currentUser = ref.watch(appUserControllerProvider).value;

    _soundEffect(isCorrect);
    _loadAdEffect(ref, currentQuizIndex);

    if(quizListData.isEmpty || quizListData.length <= currentQuizIndex.value) {
      return const Center(child: QuizLoadingIndicator());
    }
    return Stack(
      children: [
        Padding(
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
                          if(currentQuizIndex.value % 3 == 0) {
                            await interstitialAd.value?.show();
                          }
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
                TransparentCard(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 25),
                    child: Column(
                      children: [
                        if(isCorrect.value != null)
                          _displayResult(isCorrect: isCorrect.value!),
                        Column(
                          children: [
                            if(currentUser != null && isCorrect.value == null && currentUser.consecutiveCorrects > 0)
                              _displayConsecutiveCorrects(
                                consecutiveCorrects: currentUser.consecutiveCorrects,
                                context: context,
                                ref: ref,
                              ),
                            Text(quizListData[currentQuizIndex.value].question,style: quizContentTextStyle,),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                const SizedBox(height: 30,),
                Visibility(
                  visible: isCorrect.value == null,
                  child: ButtonPart(
                    quizIndex: currentQuizIndex,
                    isCorrect: isCorrect,
                    selectButtonIndex: selectButtonIndex,
                    quizListData: quizListData,
                    currentQuizIndex: currentQuizIndex,
                    updateUserQuizStatus: () async {
                      // ユーザーのステータスを更新
                      final userNewState = await ref.read(appUserControllerProvider.notifier).userStateUpdate(
                        quiz: quizListData[currentQuizIndex.value],
                        isCorrect: isCorrect.value,
                      );
                      await Future.wait([

                        // クイズを取得
                        ref.read(quizControllerProvider.notifier).fetchMoreQuiz(),

                        // クイズのステータスを更新
                        ref.read(quizControllerProvider.notifier).answeredQuizUpdate(
                          quiz: quizListData[currentQuizIndex.value],
                          selectButtonIndex: selectButtonIndex.value,
                        ),

                        // 回答済みクイズ記録を保存
                        ref.read(answeredQuizControllerProvider.notifier).save(
                          quizId: quizListData[currentQuizIndex.value].id,
                          userSelectIndex: selectButtonIndex.value,
                          isCorrect: isCorrect.value,
                        ),
                      ]);

                      // ランキングのステータスを更新
                      await ref.read(rankingUserControllerProvider.notifier).updateRankingUser(
                        user: userNewState,
                      );
                    },
                  ),
                ),
                Visibility(
                  visible: isCorrect.value != null,
                  child: TransparentCard(
                    opacity: 0.6,
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
        ),
        const Align(
            alignment: Alignment.bottomCenter,
            child: BannerAdPart(),
        ),
      ],
    );
  }

  //連続正解数表示
  Widget _displayConsecutiveCorrects({
    required int consecutiveCorrects,
    required BuildContext context,
    required WidgetRef ref,
  }) {
    final currentUser = ref.watch(appUserControllerProvider).value;
    return Column(
      children: [
        RichText(
          text: TextSpan(
            // デフォルトのスタイルを設定します
            style: const TextStyle(
              fontSize: 20,
              color: Colors.black,
            ),
            children: <TextSpan>[
              const TextSpan(text: '現在 '),
              TextSpan(
                text: '${currentUser!.consecutiveCorrects}',
                style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.red,
                    fontSize: 22,
                ),
              ),
              const TextSpan(text: ' 連続正解中！'),
            ],
          ),
        ),
        const SizedBox(height: 30,),
      ],
    );
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

  void _soundEffect(ValueNotifier<bool?> isCorrect) {
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
  }

  void _loadAdEffect (
    WidgetRef ref,
    ValueNotifier<int> currentQuizIndex,
  ) {
    final interstitialAd = ref.watch(interstitialAdControllerProvider);
    useEffect(() {
      if(interstitialAd.value != null && currentQuizIndex.value == 0) {
        return;
      }
      ref.read(interstitialAdControllerProvider.notifier).load();
      return;
    }, [currentQuizIndex.value],);
  }
}










