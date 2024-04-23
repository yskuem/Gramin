
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/core/repositories/firebase_auth/firebase_auth_repository.dart';
import 'package:flutter_app_template/features/app_user/use_case/app_user_controller.dart';
import 'package:flutter_app_template/features/quiz/use_cases/answered_quiz_controller.dart';
import 'package:flutter_app_template/features/tutorial/pages/tutorial.dart';
import 'package:flutter_app_template/features/user_profile/pages/user_profile_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/widgets/show_indicator.dart';


class DrawerMenu extends HookConsumerWidget {
  const DrawerMenu({super.key});

  static String get pageName => 'drawer_menu';
  static String get pagePath => '${UserProfilePage.pagePath}/$pageName';

  static void push(BuildContext context) {
    context.push(pagePath);
  }
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      backgroundColor: Colors.blue.withOpacity(0.8),
      body: Stack(
        children: [
          Column(
            children: [
              const SizedBox(height: 50,),
              ListTile(
                leading: const Icon(Icons.delete_forever, color: Colors.white,size: 18,),
                title: const Text(
                  'アカウント削除',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 18,
                  ),
                ),
                onTap: () {
                  showDialog<void>(
                    context: context,
                    barrierDismissible: false, // Dialog is dismissible with a tap on the barrier
                    builder: (BuildContext context) {
                      return AlertDialog(
                        title: const Text('アカウント削除'),
                        content: const SingleChildScrollView(
                          child: ListBody(
                            children: <Widget>[
                              Text('アカウント削除すると復元はできません。本当に削除しますか？'),
                            ],
                          ),
                        ),
                        actions: <Widget>[
                          TextButton(
                            child: const Text('はい', style: TextStyle(color: Colors.red)),
                            onPressed: () async {
                              showIndicator(context);
                              final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
                              if(ref.read(firebaseAuthRepositoryProvider).authUser == null || userId == null){
                                throw AppException(title: 'エラーが発生しました');
                              }
                              await ref.read(appUserControllerProvider.notifier).onDelete();
                              await ref.read(answeredQuizControllerProvider.notifier).onDelete();
                              await ref.read(firebaseAuthRepositoryProvider).userDelete(
                                ref.read(firebaseAuthRepositoryProvider).authUser!,
                              );
                              await ref.read(firebaseAuthRepositoryProvider).signOut();
                              dismissIndicator(context);
                              Navigator.of(context).pop(true);
                              TutorialPage.go(context);
                            },
                          ),
                          TextButton(
                            child: const Text('いいえ', style: TextStyle(color: Colors.blue)),
                            onPressed: () {
                              Navigator.of(context).pop(false);
                            },
                          ),
                        ],
                      );
                    },
                  );
                },
              ),
            ],
          ),
        ],
      )
    );
  }
}
