import 'dart:async';
import 'dart:io';

import 'package:hooks_riverpod/hooks_riverpod.dart';
import 'package:image_picker/image_picker.dart';

import '../../repositories/file/file_repository.dart';
import '../../utils/crop_image.dart';
import '../../utils/navigator_key_provider.dart';
import 'show_photo_bottom_sheet.dart';

Future<File?> showPhotoAndCropBottomSheet(
  WidgetRef ref, {
  String? title,
}) async {
  final context = ref.read(navigatorKeyProvider).currentContext;
  if (context == null) {
    return null;
  }
  final result = await showPhotoBottomSheet(ref, title: title);
  if (result == PhotoType.camera) {
    /// ImagePickerからfileを取得
    final file = await ImagePicker().pickImage(source: ImageSource.camera);
    if (file == null) {
      return null;
    }

    /// ImageCropperで加工したfileを取得
    if (!context.mounted) {
      return null;
    }
    final cropFile = await cropAvatar(context, file.path);

    /// ImagePickerで取得したfileがtmpに残ってしまうので削除
    await ref.read(fileRepositoryProvider).delete(file.path);

    return cropFile != null ? File(cropFile.path) : null;
  } else if (result == PhotoType.album) {
    /// ImagePickerからfileを取得
    final file = await ImagePicker().pickImage(source: ImageSource.gallery);
    if (file == null) {
      return null;
    }

    /// ImageCropperで加工したfileを取得
    if (!context.mounted) {
      return null;
    }
    final cropFile = await cropAvatar(context, file.path);

    /// ImagePickerで取得したfileがtmpに残ってしまうので削除
    await ref.read(fileRepositoryProvider).delete(file.path);

    return cropFile != null ? File(cropFile.path) : null;
  }
  return null;
}
