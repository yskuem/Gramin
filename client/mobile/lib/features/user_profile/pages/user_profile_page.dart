
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/user_profile/parts/profile_part.dart';
import 'package:flutter_app_template/features/user_profile/parts/user_result_part.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app_user/use_case/app_user_controller.dart';
import '../../app_wrapper/pages/main_page.dart';
import 'edit_user_profile_page.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  static String get pageName => 'user_profile';
  static String get pagePath => '${MainPage.pagePath}/$pageName';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final userId = ref.watch(appUserControllerProvider).value?.authId;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 15,
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 25),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      TextButton(
                        onPressed: (){
                          EditUserProfilePage.push(context);
                        },
                        child: const Text('プロフィール編集',style: TextStyle(fontSize: 17,color: Colors.black),),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 15,
                ),
                const ProfilePart(),
                const SizedBox(
                  height: 30,
                ),
                UserResultPart(userId: userId ?? ''),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





