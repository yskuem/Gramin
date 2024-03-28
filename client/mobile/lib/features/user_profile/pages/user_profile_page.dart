
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/user_profile/parts/profile_part.dart';
import 'package:flutter_app_template/features/user_profile/parts/quiz_score_part.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../app_wrapper/pages/main_page.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({super.key});

  static String get pageName => 'user_profile';
  static String get pagePath => '${MainPage.pagePath}/$pageName';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return const SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SizedBox(
                  height: 60,
                ),
                ProfilePart(),
                SizedBox(
                  height: 30,
                ),
                QuizScorePart(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





