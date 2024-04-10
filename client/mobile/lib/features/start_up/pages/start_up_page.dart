import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/start_up/pages/register_name_page.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:page_transition/page_transition.dart';

import '../../../../features/app_wrapper/pages/main_page.dart';
import '../../../core/extensions/context_extension.dart';
import '../../../core/utils/logger.dart';
import '../../../core/widgets/texts/error_text.dart';
import '../use_cases/start_up.dart';
import '../use_cases/update_check.dart';

class StartUpPage extends HookConsumerWidget {
  const StartUpPage({super.key});

  static String get pageName => 'start_up';
  static String get pagePath => '/';

  /// go_routerの画面遷移
  static void pushReplacement(BuildContext context) {
    context.pushReplacement(pagePath);
  }

  static void go(BuildContext context) {
    context.go(pagePath);
  }

  /// 従来の画面遷移
  static Future<void> showNav1(BuildContext context) async {
    await Navigator.of(context, rootNavigator: true)
        .pushReplacement<MaterialPageRoute<dynamic>, void>(
      PageTransition(
        type: PageTransitionType.fade,
        child: const StartUpPage(),
        duration: const Duration(milliseconds: 500),
        settings: RouteSettings(name: pageName),
      ),
    );
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final asyncValue = ref.watch(startUpStateControllerProvider);
    final isUpdateNeeded = ref.watch(isUpdateNeededProvider);

    useEffect(() {
      Future.microtask(() async {
        final result = await ref.read(startUpStateControllerProvider.future);
        if(result == StartUpResultType.noLogin) {
          return;
        }
        if(isUpdateNeeded.value == false) {
          MainPage.go(context);
        }
      });
      return null;
    }, [isUpdateNeeded.value],);

    return Scaffold(
      body: Center(
        child: asyncValue.when(
          data: (data) {
            if (data == StartUpResultType.forcedVersionUpgrade) {
              return Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    '最新バージョンがリリースされています\nアップグレードしてください',
                    style: context.bodyStyle,
                    textAlign: TextAlign.center,
                  ),
                  TextButton(
                    child: Text(
                      'アプリストアを確認',
                      style: context.bodyStyle.copyWith(
                        color: Colors.blueAccent,
                      ),
                    ),
                    onPressed: () {
                      // TODO(shohei): アプリストアへ遷移
                    },
                  ),
                ],
              );
            }
            if (data == StartUpResultType.noLogin) {
              return const RegisterNamePage();
            }
            return const SizedBox.shrink();
          },
          error: (e, __) {
            logger.shout(e);
            final message = 'エラー\n$e';
            return ErrorText(
              message: message,
              onRetry: () {
                ref.invalidate(startUpStateControllerProvider);
              },
            );
          },
          loading: () {
            return const CupertinoActivityIndicator();
          },
        ),
      ),
    );
  }
}
