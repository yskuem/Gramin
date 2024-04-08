


import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/card/transparent_card.dart';
import 'package:flutter_app_template/features/ranking/parts/ranking_tile.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../app_wrapper/pages/main_page.dart';
import '../use_case/ranking_user_controller.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  static String get pageName => 'ranking_page';
  static String get pagePath => '${MainPage.pagePath}/$pageName';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final rankingUserList = ref.watch(rankingUserControllerProvider);
    final rankingUserLength = rankingUserList.value?.length ?? 0;
    final isFinishedFetch = useState(false);
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
                itemCount: rankingUserLength + 1,
                itemBuilder: (context, index) {
                  if(index == rankingUserLength) {
                    return _bottomWidget(ref,isFinishedFetch);
                  }
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

  Widget _bottomWidget(WidgetRef ref,ValueNotifier<bool> isFinishedFetch) {
    final rankingUserList = ref.watch(rankingUserControllerProvider);
    if(rankingUserList.isLoading) {
      return const CircularProgressIndicator();
    }
    if(isFinishedFetch.value) {
      return const Padding(
        padding: EdgeInsets.all(8),
        child: TransparentCard(
            child: Center(
                child: Padding(
                  padding: EdgeInsets.all(8),
                  child: Text(
                    'ユーザは以上です',style: TextStyle(fontSize: 18),
                  ),
                ),
            ),
        ),
      );
    }
    return Padding(
      padding: const EdgeInsets.all(6),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue[500],
        ),
        onPressed: () async {
          final isFinished = await ref.read(rankingUserControllerProvider.notifier).fetchMoreRankingUser();
          isFinishedFetch.value = isFinished;
        },
        child: const Text('もっと見る'),
      ),
    );
  }
}
