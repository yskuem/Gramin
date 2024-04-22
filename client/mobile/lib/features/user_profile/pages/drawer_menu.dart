

import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/user_profile/pages/user_profile_page.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

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
      body: Container(),
    );
  }
}