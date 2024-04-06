


import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/ranking/parts/ranking_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_wrapper/pages/main_page.dart';
import '../use_case/ranking_user_controller.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  static String get pageName => 'ranking_page';
  static String get pagePath => '${MainPage.pagePath}/$pageName';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final rankingUserList = ref.watch(rankingUserControllerProvider).value;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SingleChildScrollView(
          child: Column(
            children: [
              const SizedBox(
                height: 20,
              ),
              ListView.builder(
                physics: const NeverScrollableScrollPhysics(),
                shrinkWrap: true,
                itemCount: rankingUserList?.length ?? 0,
                itemBuilder: (context, index) {
                  return Padding(
                    padding: const EdgeInsets.symmetric(vertical:8, horizontal:10),
                    child: RankingTile(
                        index: index,
                        height: MediaQuery.sizeOf(context).height * 1/7,
                        width: MediaQuery.sizeOf(context).width * 8/10,
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
