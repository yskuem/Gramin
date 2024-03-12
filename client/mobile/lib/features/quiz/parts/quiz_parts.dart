
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../entities/quiz.dart';

class QuizParts extends HookConsumerWidget {
  const QuizParts({super.key,required this.quizListData});

  final List<Quiz> quizListData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final index = useState<int>(0).value;
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
      appBar: AppBar(
        title: const Text('クイズ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          if(isCorrect.value != null)
            _displayResult(isCorrect: isCorrect.value!),
          Text(quizListData[index].question),
          Column(
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
                              quizData: quizListData[index],
                              selectIndex: rowIndex * 2 + buttonIndex,
                          );
                          isCorrect.value = isCorrectQuiz;
                          debugPrint(isCorrect.value.toString());
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
                        child: Text(quizListData[index].choices[rowIndex * 2 + buttonIndex]),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
  bool _isAnswerCorrect ({required Quiz quizData,required int selectIndex}) {
    if (quizData.choices[selectIndex] == quizData.answer) {
      return true;
    }
    return false;
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
            : const Text('不正解！',style: TextStyle(color: Colors.blue,fontSize: 25),)
      ],
    );
  }
}