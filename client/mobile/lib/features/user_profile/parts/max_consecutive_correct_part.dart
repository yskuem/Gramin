

import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/app_user/use_case/provide_target_user.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import 'constant.dart';


class MaxConsecutiveCountPart extends HookConsumerWidget {
  const MaxConsecutiveCountPart({
    super.key,
    required this.userId,
  });

  final String userId;
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appUser = ref.watch(provideTargetUserProvider(userId: userId));
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      height: MediaQuery.sizeOf(context).height * 0.2,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            '最大連続正解数',
            style: headLineTextStyle.copyWith(
              color: Colors.black,
            ),
          ),
          const SizedBox(height: 10),
          Text(
            '${appUser.value?.maxConsecutiveCorrects ?? 0}',
            style: contentTextStyle.copyWith(
              color: Colors.red,
            ),
          ),
        ],
      ),
    );
  }
}
