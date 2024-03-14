
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz/constants/constants.dart';
import 'package:flutter_app_template/features/quiz/use_cases/quiz_controller.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class ExplanationPart extends HookConsumerWidget {
  const ExplanationPart({
    super.key,
    required this.quizIndex,
    required this.selectButtonIndex,
  });

  final ValueNotifier<int> quizIndex;
  final ValueNotifier<int> selectButtonIndex;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final quizData = ref.watch(quizControllerProvider).asData!.value[quizIndex.value];
    return Column(
      children: [
        _displayCorrectAnswer(
            headLineList: ['正しい解答','あなたの回答',],
            contentList: [quizData.answer,quizData.choices[selectButtonIndex.value]],
        ),
        _explanationParts(
            headLineList: ['解説','日本語訳',],
            contentList: [quizData.explanation,quizData.translation],
        ),
      ],
    );
  }


  Widget _displayCorrectAnswer ({
    required List<String> headLineList,
    required List<String> contentList,
  }) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        for(var i = 0; i < headLineList.length; i++)
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
            child: Column(
              children: [
                Text(headLineList[i],style: quizHeadlineTextStyle,),
                const SizedBox(height: 10,),
                Text(contentList[i],style: quizContentTextStyle,),
                const SizedBox(height: 30,),
              ],
            ),
          ),
      ],
    );
  }

  Widget _explanationParts ({
    required List<String> headLineList,
    required List<String> contentList,
  }){
    return Column(
      children: [
        for(var i = 0; i < headLineList.length; i++)
          Column(
            children: [
              Text(headLineList[i],style: quizHeadlineTextStyle,),
              const SizedBox(height: 10,),
              Text(contentList[i],style: quizContentTextStyle,),
              const SizedBox(height: 30,),
            ],
          ),
      ],
    );
  }
}
