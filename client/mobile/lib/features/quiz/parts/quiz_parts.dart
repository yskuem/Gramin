
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz/constants/constants.dart';
import 'package:flutter_app_template/features/quiz/parts/button_part.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
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
                      onPressed: () {
                        currentQuizIndex.value ++;
                        isCorrect.value = null;
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


