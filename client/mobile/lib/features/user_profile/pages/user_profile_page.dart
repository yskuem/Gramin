
import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/user_profile/parts/profile_part.dart';
import 'package:flutter_app_template/features/user_profile/parts/user_result_part.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';
import '../../../core/repositories/firebase_auth/firebase_auth_repository.dart';
import '../../app_wrapper/pages/main_page.dart';
import '../parts/drawer_menu.dart';
import 'edit_user_profile_page.dart';

class UserProfilePage extends HookConsumerWidget {
  const UserProfilePage({
    super.key,
  });


  static void push(
      BuildContext context, {
        required String id,
      }) {
    context.push(
      pagePath,
      extra: id,
    );
  }

  static String get pageName => 'user_profile';
  static String get pagePath => '${MainPage.pagePath}/$pageName';


  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final authId = ref.watch(firebaseAuthRepositoryProvider).loggedInUserId;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: PreferredSize(
          preferredSize: const Size.fromHeight(50),
          child: AppBar(
            actions: [
              Padding(
                padding: const EdgeInsets.only(left: 10,top: 10),
                child: Padding(
                  padding: const EdgeInsets.only(right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
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
              ),
            ],
            elevation: 0,
            backgroundColor: Colors.transparent,
          ),
        ),
        drawer: const Drawer(
          backgroundColor: Colors.transparent,
          child: DrawerMenu(),
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
                  authId: authId ?? '',
                ),
                const SizedBox(
                  height: 30,
                ),
                UserResultPart(
                    authId: authId ?? '',
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}





