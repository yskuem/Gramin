
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class CustomTextFormField extends HookConsumerWidget {
  const CustomTextFormField({
    super.key,
    required this.textKey,
    required this.maxLength,
    required this.labelName,
    required this.errorTextNotifier,
    this.borderSideColor,
  });

  final GlobalKey<FormFieldState<String>> textKey;
  final String labelName;
  final ValueNotifier<String?> errorTextNotifier;
  final Color? borderSideColor;
  final int maxLength;

  @override
  Widget build(BuildContext context,WidgetRef ref) {
    return TextFormField(
      maxLength: maxLength,
      key: textKey,
      decoration: InputDecoration(
        labelText: labelName,
        errorText: errorTextNotifier.value,
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(25),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(
              width: 2,
              color: borderSideColor ?? const Color(0xFF000000),
          ),
          borderRadius: BorderRadius.circular(25),
        ),
      ),
    );
  }
}
