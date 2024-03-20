
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
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
            context: context,
        ),
        _explanationParts(
            headLineList: ['日本語訳','解説',],
            contentList: [quizData.translation,quizData.explanation],
        ),
      ],
    );
  }


  Widget _displayCorrectAnswer ({
    required List<String> headLineList,
    required List<String> contentList,
    required BuildContext context,
  }) {
    return SizedBox(
      width: MediaQuery.sizeOf(context).width,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          for(var i = 0; i < headLineList.length; i++)
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10,horizontal: 20),
              child: Column(
                children: [
                  Text(headLineList[i],style: quizHeadlineTextStyle,),
                  const SizedBox(height: 10,),
                  Container(
                      constraints: BoxConstraints(
                        maxWidth: MediaQuery.sizeOf(context).width * 4 / 10,
                      ),
                      child: Text(contentList[i],style: quizContentTextStyle),
                  ),
                  const SizedBox(height: 30,),
                ],
              ),
            ),
        ],
      ),
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
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15,vertical: 5),
                child: Text(contentList[i],style: quizContentTextStyle,),
              ),
              const SizedBox(height: 30,),
            ],
          ),
      ],
    );
  }
}
