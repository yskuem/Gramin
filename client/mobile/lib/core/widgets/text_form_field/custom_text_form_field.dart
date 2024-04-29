
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField(
      {
        super.key,
        this.keyBoardType,
        required this.textKey,
        required this.maxLength,
        required this.labelName,
        required this.validator,
      }
  );

  final GlobalKey<FormFieldState<String>> textKey;
  final String labelName;
  final int maxLength;
  final TextInputType? keyBoardType;
  final FormFieldValidator<String> validator;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      maxLength: maxLength,
      key: textKey,
      keyboardType: keyBoardType,
      decoration: InputDecoration(
        labelText: labelName,
      ),
      validator: validator,
    );
  }
}
