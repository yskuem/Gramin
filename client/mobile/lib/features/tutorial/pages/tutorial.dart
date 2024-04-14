import 'package:flutter/material.dart';
import 'package:flutter_app_template/features/start_up/pages/register_name_page.dart';
import 'package:flutter_overboard/flutter_overboard.dart';
import 'package:go_router/go_router.dart';

import '../../../core/res/gen/assets.gen.dart';


class TutorialPage extends StatefulWidget {
  const TutorialPage({super.key});

  static String get pageName => 'tutorial';
  static String get pagePath => '/$pageName';

  static void go(BuildContext context) {
    context.go(pagePath);
  }

  @override
  State<TutorialPage> createState() => _TutorialPageState();
}

class _TutorialPageState extends State<TutorialPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    final globalKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key: globalKey,
      body: OverBoard(
        allowScroll: true,
        pages: pages,
        inactiveBulletColor: Colors.blue,
        skipCallback: () {},
        finishCallback: () {
          RegisterNamePage.pushReplacement(context);
        },
      ),
    );
  }

  final pages = [
    PageModel.withChild(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.tutorialPic1.path, width: 300, height: 300),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'インストールしていただきありがとうございます。このアプリは楽しみながら英文法を学習するアプリです。',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      color: const Color(0xFF0097A7),
      doAnimateChild: true,
    ),
    PageModel.withChild(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.tutorialPic2.path, width: 500, height: 500),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                'AIが無限に4択の英文法問題を生成します。無限に新しい問題を解くことができます。',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      color: const Color(0xFF0097A7),
      doAnimateChild: true,
    ),
    PageModel.withChild(
      child: Padding(
        padding: const EdgeInsets.only(bottom: 25),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(Assets.images.tutorialPic3.path, width: 500, height: 500),
            const SizedBox(height: 50),
            const Padding(
              padding: EdgeInsets.symmetric(horizontal: 25),
              child: Text(
                '問題に正解していくとランキングとレベルが上がります。他のユーザーと競い合ってモチベーションを高めましょう！',
                style: TextStyle(fontSize: 18, color: Colors.white),
              ),
            ),
          ],
        ),
      ),
      color: const Color(0xFF0097A7),
      doAnimateChild: true,
    ),
  ];
}
