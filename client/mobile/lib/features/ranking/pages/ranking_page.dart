
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/ranking/parts/ranking_tile.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:pull_to_refresh_flutter3/pull_to_refresh_flutter3.dart';

import '../../../core/custom_hooks/use_refresh_controller.dart';
import '../../app_wrapper/pages/main_page.dart';
import '../../user_profile/pages/other_profile_page.dart';
import '../use_case/ranking_user_controller.dart';

class RankingPage extends HookConsumerWidget {
  const RankingPage({super.key});

  static String get pageName => 'ranking_page';
  static String get pagePath => '${MainPage.pagePath}/$pageName';

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final rankingUserList = ref.watch(rankingUserControllerProvider);
    final rankingUserLength = rankingUserList.value?.length ?? 0;
    final refreshController = useRefreshController();
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ランキング',
          style: TextStyle(
              color: Colors.black,
          ),
        ),
        backgroundColor: Colors.transparent,
      ),
      backgroundColor: Colors.transparent,
      body: SmartRefresher(
        controller: refreshController,
        header: const WaterDropMaterialHeader(),
        physics: const BouncingScrollPhysics(),
        enablePullUp: true,
        enablePullDown: false,
        footer: CustomFooter(
          builder: (context, mode) {
            return SizedBox(
              height: 55,
              child: mode == LoadStatus.idle
                  ? const SizedBox.shrink()
                  : const Center(child: CircularProgressIndicator()),
            );
          },
        ),
        onLoading: () async {
          await ref.read(rankingUserControllerProvider.notifier).fetchMoreRankingUser();
          refreshController.loadComplete();
        },
        child: ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          shrinkWrap: true,
          itemCount: rankingUserLength,
          itemBuilder: (context, index) {
            return GestureDetector(
              onTap: () {
                OtherProfilePage.push(
                    context,
                    id: rankingUserList.value?[index].authId ?? '',
                );
              },
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical:8, horizontal:10),
                child: RankingTile(
                  index: index,
                  height: MediaQuery.sizeOf(context).height * 1/7,
                  width: MediaQuery.sizeOf(context).width * 8/10,
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}



