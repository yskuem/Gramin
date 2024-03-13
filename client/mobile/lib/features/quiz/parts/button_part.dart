
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz/use_cases/quiz_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/quiz.dart';


class ButtonPart extends HookConsumerWidget {
  const ButtonPart({
    super.key,
    required this.quizIndex,
    required this.isCorrect,
    required this.selectButtonIndex,
  });

  final ValueNotifier<bool?> isCorrect;
  final ValueNotifier<int> quizIndex;
  final ValueNotifier<int> selectButtonIndex;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final quizData = ref.watch(quizControllerProvider).asData!.value[quizIndex.value];
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(2, (rowIndex) =>
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: List.generate(2, (buttonIndex) =>
                Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 8,
                    vertical: 18,
                  ),
                  child: SizedBox(
                    height: MediaQuery.sizeOf(context).height / 8,
                    width: MediaQuery.sizeOf(context).width / 2.5,
                    child: ElevatedButton(
                      onPressed: () {
                        final isCorrectQuiz = _isAnswerCorrect(
                          quizData: quizData,
                          selectIndex: rowIndex * 2 + buttonIndex,
                        );
                        isCorrect.value = isCorrectQuiz;
                        //context.go('/');
                      },
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all<Color>(
                          Colors.blue,
                        ),
                        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(20),
                          ),
                        ),
                      ),
                      child: RichText(
                        text: TextSpan(
                          text: quizData.choices[rowIndex * 2 + buttonIndex],
                          style: const TextStyle(fontSize: 18,fontWeight: FontWeight.bold),
                        ),
                      ),
                    ),
                  ),
                ),
            ),
          ),
      ),
    );
  }
  bool _isAnswerCorrect ({required Quiz quizData,required int selectIndex}) {
    selectButtonIndex.value = selectIndex;
    if (quizData.choices[selectIndex] == quizData.answer) {
      return true;
    }
    return false;
  }
}
