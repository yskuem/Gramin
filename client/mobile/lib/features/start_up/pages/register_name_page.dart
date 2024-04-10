
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/utils/image_operations.dart';
import 'package:flutter_app_template/core/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_app_template/features/start_up/use_cases/start_up.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/custom_hooks/use_form_field_state_key.dart';
import '../../../core/widgets/show_indicator.dart';
import '../../app_wrapper/pages/main_page.dart';

class RegisterNamePage extends HookConsumerWidget {
  const RegisterNamePage({super.key});

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final textKey = useFormFieldStateKey();
    final errorTextNotifier = useState<String?>(null);
    final fileImage = useState<File?>(null);
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Spacer(flex: 3,),
                const Text('※ ニックネームとプロフィール画像は'),
                const Text('ランキングで公開されます。後から変更可能です。'),
                const SizedBox(height: 50,),
                GestureDetector(
                  onTap: () async {
                    final pickFile = await ImageOperations.pickImage();
                    fileImage.value = pickFile;
                  },
                  child: CircleAvatar(
                    backgroundImage: fileImage.value != null ? FileImage(fileImage.value!) : null,
                    //イメージがnullのときはなし
                    radius: 40,
                    child: const Icon(Icons.camera_alt_outlined,color: Colors.white,size: 40,),
                  ),
                ),
                const SizedBox(height: 10,),
                const Text('アイコン選択'),
                const Spacer(flex: 2,),
                CustomTextFormField(
                    maxLength: 10,
                    labelName: 'ユーザーネーム',
                    errorTextNotifier: errorTextNotifier,
                    textKey: textKey,
                ),
                const Spacer(),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 7/10,
                  height: MediaQuery.sizeOf(context).height * 1/15,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (textKey.currentState?.validate() != true) {
                          return;
                        }
                        showIndicator(context);
                        //TODO: 画像圧縮&アップロード

                        await ref.read(startUpStateControllerProvider.notifier).singInApp(
                            userName: textKey.currentState?.value ?? '',
                          //TODO:アイコンURL追加
                        );
                        final type = await ref.read(startUpStateControllerProvider.future);
                        dismissIndicator(context);
                        if(type == StartUpResultType.loginSuccess) {
                          MainPage.go(context);
                        }
                      },
                      child: const Text(
                        'はじめる',
                        style: TextStyle(
                            fontSize: 18,
                            fontWeight: FontWeight.bold,
                        ),
                      ),
                  ),
                ),
                const Spacer(flex: 3,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
