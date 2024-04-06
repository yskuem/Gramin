import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/quiz/pages/quiz_page.dart';
import 'package:flutter_app_template/features/ranking/pages/ranking_page.dart';
import 'package:flutter_app_template/features/user_profile/pages/user_profile_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../../core/res/gen/assets.gen.dart';
import '../../../core/utils/tab_tap_operation_provider.dart';
import 'widgets/tab_navigator.dart';

class MainPage extends HookConsumerWidget {
  const MainPage({super.key});

  static String get pageName => 'main';
  static String get pagePath => '/$pageName';

  /// go_routerの画面遷移
  static void go(BuildContext context) {
    context.go(pagePath);
  }

  /// 従来の画面遷移
  static Future<void> showNav1(BuildContext context) =>
      Navigator.of(context, rootNavigator: true).pushReplacement<void, void>(
        PageTransition(
          type: PageTransitionType.fade,
          child: const MainPage(),
          duration: const Duration(milliseconds: 500),
          settings: RouteSettings(name: pageName),
        ),
      );

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final widgetsState =
        useState<List<(GlobalKey<NavigatorState>, String, Widget)>>(
      [
        (
          GlobalKey<NavigatorState>(),
          QuizPage.pageName,
          const QuizPage(),
        ),
        (
          GlobalKey<NavigatorState>(),
          UserProfilePage.pageName,
          const UserProfilePage(),
        ),

        (
        GlobalKey<NavigatorState>(),
        RankingPage.pageName,
        const RankingPage(),
        ),
      ],
    );
    final widgets = widgetsState.value;

    final selectedTabIndexState = useState(0);
    final selectedTabIndex = selectedTabIndexState.value;

    return PopScope(
      canPop: false,
      onPopInvoked: (didPop) async {
        if (didPop) {
          return;
        }
        final keyTab = widgetsState.value[selectedTabIndex].$1;
        if (keyTab.currentState != null && keyTab.currentState!.canPop()) {
          await keyTab.currentState!.maybePop();
        }
      },
      child: Container(
        height: MediaQuery.sizeOf(context).height,
        width: MediaQuery.sizeOf(context).width,
        decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(Assets.images.quizBack1.path),
              fit: BoxFit.cover,
            ),
        ),
        child: Scaffold(
          backgroundColor: Colors.transparent,
          resizeToAvoidBottomInset: false,
          body: IndexedStack(
            index: selectedTabIndex,
            children: List.generate(
              widgets.length,
              (index) => TabNavigator(
                navigatorKey: widgets[index].$1,
                page: widgets[index].$3,
              ),
            ),
          ),
          bottomNavigationBar: NavigationBar(
            backgroundColor: Colors.white.withOpacity(0.3),//TODO Themeに移行する
            onDestinationSelected: (int index) {
              /// 同じタブが選択されたことを通知する
              if (index == selectedTabIndex) {
                final pageName = widgets[index].$2;
                ref
                    .read(tabTapOperationProviders(pageName))
                    .call(TabTapOperationType.duplication);
              }

              /// タブを切り替える
              selectedTabIndexState.value = index;
            },
            selectedIndex: selectedTabIndex,
            destinations: const <Widget>[
              NavigationDestination(
                selectedIcon: Icon(Icons.quiz),
                icon: Icon(Icons.quiz_outlined),
                label: 'クイズ',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.people),
                icon: Icon(Icons.people_outlined),
                label: 'プロフィール',
              ),
              NavigationDestination(
                selectedIcon: Icon(Icons.people),
                icon: Icon(Icons.people_outlined),
                label: 'ランキング',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
