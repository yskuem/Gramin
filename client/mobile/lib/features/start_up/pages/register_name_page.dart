
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/widgets/text_form_field/custom_text_form_field.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

import '../../../core/custom_hooks/use_form_field_state_key.dart';

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
              ],
            ),
          ),
        ),
      ),
    );
  }
}
