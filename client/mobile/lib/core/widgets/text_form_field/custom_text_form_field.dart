
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField({
    super.key,
    required this.textKey,
    required this.maxLength,
    required this.labelName,
    required this.errorTextNotifier,
  });

  final GlobalKey<FormFieldState<String>> textKey;
  final String labelName;
  final ValueNotifier<String?> errorTextNotifier;
  final int maxLength;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      maxLength: maxLength,
      key: textKey,
      decoration: InputDecoration(
        labelText: labelName,
        errorText: errorTextNotifier.value,
      ),
    );
  }
}
