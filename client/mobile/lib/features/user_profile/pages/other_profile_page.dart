
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/ranking/pages/ranking_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/res/gen/assets.gen.dart';
import '../parts/profile_part.dart';
import '../parts/user_result_part.dart';

class OtherProfilePage extends HookConsumerWidget {
  const OtherProfilePage({super.key, required this.authId});

  final String authId;


  static void push(
      BuildContext context, {
        required String id,
      }) {
    context.push(
      pagePath,
      extra: id,
    );
  }

  static String get pageName => 'other_profile';
  static String get pagePath => '${RankingPage.pagePath}/$pageName';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return Container(
      height: MediaQuery.sizeOf(context).height,
      width: MediaQuery.sizeOf(context).width,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(Assets.images.quizBack1.path),
          fit: BoxFit.cover,
        ),
      ),
      child: SafeArea(
        child: Scaffold(
          backgroundColor: Colors.transparent,
          appBar: PreferredSize(
            preferredSize: const Size.fromHeight(50),
            child: AppBar(
              leading: Padding(
                padding: const EdgeInsets.only(left: 10),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    color: Colors.black,
                  ),
                  onPressed: () {
                    context.pop();
                  },
                ),
              ),
              actions: const [],
              elevation: 0,
              backgroundColor: Colors.transparent,
              title: const Text(
                'プロフィール',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 20,
                ),
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const SizedBox(
                    height: 25,
                  ),
                  ProfilePart(
                    authId: authId,
                  ),
                  const SizedBox(
                    height: 30,
                  ),
                  UserResultPart(
                      authId: authId,
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
