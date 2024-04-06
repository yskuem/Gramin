
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app_user/use_case/app_user_controller.dart';
import 'constant.dart';


class QuizScorePart extends HookConsumerWidget {
  const QuizScorePart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appUser = ref.watch(appUserControllerProvider);
    final correctCount = appUser.value?.correctCount ?? 0;
    final inCorrectCount = appUser.value?.inCorrectCount ?? 0;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '正解数',
                style: headLineTextStyle.copyWith(
                  color: Colors.red,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '$correctCount',
                style: contentTextStyle.copyWith(
                  color: Colors.red,
                ),
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                '不正解数',
                style: headLineTextStyle.copyWith(
                  color: Colors.blue,
                ),
              ),
              const SizedBox(height: 10),
              Text(
                '$inCorrectCount',
                style: contentTextStyle.copyWith(
                  color: Colors.blue,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
