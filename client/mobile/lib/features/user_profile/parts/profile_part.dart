
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/core/widgets/display_level.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_user/use_case/app_user_controller.dart';

class ProfilePart extends HookConsumerWidget {
  const ProfilePart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appUser = ref.watch(appUserControllerProvider);
    final level = appUser.value?.calcUserLevel ?? 0;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TransparentCard(
          opacity: 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10,vertical: 30),
            child: Column(
              children: [
                Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        foregroundImage: NetworkImage(appUser.value?.iconUrl ?? ''),
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appUser.value?.name ?? '',style: const TextStyle(fontSize: 20),),
                        Text(
                          '@${appUser.value?.displayId}',
                          style: const TextStyle(
                              fontSize: 15,color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(),
                    DisplayLevel(level: level),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(appUser.value?.description ?? '',style: const TextStyle(fontSize: 15),),
              ],
            ),
          ),
      ),
    );
  }
}
