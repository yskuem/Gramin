
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/user_profile/parts/display_user_level_part.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_user/use_case/app_user_controller.dart';

class ProfilePart extends HookConsumerWidget {
  const ProfilePart({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final appUser = ref.watch(appUserControllerProvider).value;
    return SizedBox(
      width: MediaQuery.sizeOf(context).width * 0.9,
      child: TransparentCard(
          opacity: 0.6,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 25,vertical: 20),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 15,),
                Row(
                  children: [
                    CircleAvatar(
                        radius: 30,
                        foregroundImage: CachedNetworkImageProvider(
                          appUser?.iconUrl ?? '',
                        ) as ImageProvider,
                    ),
                    const SizedBox(width: 10,),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(appUser?.name ?? '',style: const TextStyle(fontSize: 20),),
                        Text(
                          '@${appUser?.displayId}',
                          style: const TextStyle(
                              fontSize: 15,color: Colors.blueGrey,
                          ),
                        ),
                      ],
                    ),
                    const Spacer(flex: 5,),
                    Column(
                      children: [
                        DisplayUserLevelPart(
                          userId: appUser?.authId ?? '',
                        ),
                      ],
                    ),
                    const Spacer(),
                  ],
                ),
                const SizedBox(height: 20,),
                Text(appUser?.description ?? '',style: const TextStyle(fontSize: 15),),
              ],
            ),
          ),
      ),
    );
  }
}
