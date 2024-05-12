import 'package:flutter/foundation.dart';
import 'package:flutter_app_template/features/quiz/pages/quiz_page.dart';
import 'package:flutter_app_template/features/ranking/pages/ranking_page.dart';
import 'package:flutter_app_template/features/start_up/pages/register_name_page.dart';
import 'package:flutter_app_template/features/tutorial/pages/tutorial.dart';
import 'package:flutter_app_template/features/user_profile/pages/other_profile_page.dart';
import 'package:flutter_app_template/features/user_profile/pages/user_profile_page.dart';
import 'package:flutter_app_template/features/user_profile/parts/drawer_menu.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../features/features.dart';
import '../../features/user_profile/pages/edit_user_profile_page.dart';
import '../utils/logger.dart';
import '../utils/navigator_key_provider.dart';
import 'transition_observer.dart';

// TODO(shohei): StatefulShellRoute は未対応
final routerProvider = Provider((ref) {
  final navigatorKey = ref.watch(navigatorKeyProvider);
  final transitionObserver = ref.watch(transitionObserverProvider);
  return GoRouter(
    navigatorKey: navigatorKey,
    initialLocation: StartUpPage.pagePath,
    debugLogDiagnostics: kDebugMode,
    observers: [transitionObserver],
    routes: [
      /// 起動画面
      GoRoute(
        path: StartUpPage.pagePath,
        name: StartUpPage.pageName,
        pageBuilder: (_, state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: const StartUpPage(),
          );
        },
      ),
      GoRoute(
        path: TutorialPage.pagePath,
        name: TutorialPage.pageName,
        pageBuilder: (_, state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: const TutorialPage(),
          );
        },
      ),
      GoRoute(
        path: RegisterNamePage.pagePath,
        name: RegisterNamePage.pageName,
        pageBuilder: (_, state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: const RegisterNamePage(),
          );
        },
      ),


      /// WebView
      GoRoute(
        path: WebViewPage.pagePath,
        name: WebViewPage.pageName,
        builder: (_, state) {
          final args = state.extra! as WebViewArgs;
          return WebViewPage(args: args);
        },
      ),

      /// メイン
      GoRoute(
        path: MainPage.pagePath,
        name: MainPage.pageName,
        pageBuilder: (_, state) {
          return NoTransitionPage<void>(
            key: state.pageKey,
            child: const MainPage(),
          );
        },
        routes: [
          GoRoute(
            name: QuizPage.pageName,
            path: QuizPage.pageName,
            builder: (_, __) => const QuizPage(),
            routes: [
              GoRoute(
                name: DrawerMenu.pageName,
                path: DrawerMenu.pageName,
                builder: (_, __) => const DrawerMenu(),
              ),
            ],
          ),
          GoRoute(
            name: UserProfilePage.pageName,
            path: UserProfilePage.pageName,
            builder: (_, __) => const UserProfilePage(),
            routes: [
              GoRoute(
                name: EditUserProfilePage.pageName,
                path: EditUserProfilePage.pageName,
                builder: (_, __) => const EditUserProfilePage(),
              ),
            ],
          ),
          GoRoute(
            name: RankingPage.pageName,
            path: RankingPage.pageName,
            builder: (_, __) => const RankingPage(),
            routes: [
              GoRoute(
                name: OtherProfilePage.pageName,
                path: OtherProfilePage.pageName,
                builder: (_, state) {
                  final userId = state.extra as String?;
                  return OtherProfilePage(
                    authId: userId ?? '',
                  );
                },
              ),
            ],
          ),
        ],
      ),
    ],
    errorBuilder: (context, state) {
      logger.shout(state.error);
      return const ErrorPage();
    },
  );
});
