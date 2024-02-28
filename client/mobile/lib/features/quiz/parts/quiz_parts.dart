
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../entities/quiz.dart';

class QuizParts extends HookConsumerWidget {
  const QuizParts({super.key,required this.quizData});

  final Quiz quizData;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('クイズ'),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(quizData.question),
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
                        child: Text(quizData.choices[rowIndex * 2 + buttonIndex]),
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
}
