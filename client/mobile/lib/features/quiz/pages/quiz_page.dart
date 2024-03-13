import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/error/widgets/error_message.dart';
import 'package:flutter_app_template/features/quiz/parts/quiz_parts.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../use_cases/quiz_controller.dart';



class QuizPage extends HookConsumerWidget {
  const QuizPage({super.key});

  static String get pageName => 'quiz';
  static String get pagePath => '/$pageName';

  static void push(BuildContext context) {
    context.push(pagePath);
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final quizList = ref.watch(quizControllerProvider);
    return SafeArea(
      child: Scaffold(
        body: quizList.when(
          data: (data) {
            return QuizParts(quizListData: data,);
          },
          error: (e, _) => ErrorMessage(
            message: e.toString(),
            onTapRetry: () async {
              ref.invalidate(quizControllerProvider);
            },
          ),
          loading: () => const Center(
            child: CupertinoActivityIndicator(),
          ),
        ),
      ),
    );
  }
}
