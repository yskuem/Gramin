
import 'package:flutter/material.dart';
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
    return GestureDetector(
      onTap: () => FocusScope.of(context).unfocus(),
      child: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20),
          child: Scaffold(
            body: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                CustomTextFormField(
                    maxLength: 10,
                    labelName: 'ユーザーネーム',
                    errorTextNotifier: errorTextNotifier,
                    textKey: textKey,
                ),
                const SizedBox(height: 50,),
                SizedBox(
                  width: MediaQuery.sizeOf(context).width * 7/10,
                  height: MediaQuery.sizeOf(context).height * 1/15,
                  child: ElevatedButton(
                      onPressed: () async {
                        if (textKey.currentState?.validate() != true) {
                          return;
                        }
                        showIndicator(context);
                        await ref.read(startUpStateControllerProvider.notifier).singInApp(
                            userName: textKey.currentState?.value ?? '',
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
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
