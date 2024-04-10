

import 'dart:io';

import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart';

class ImageOperations {
  ImageOperations._();

  static Future<File?> pickImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      return File(pickedFile.path);
    } else {
      return null;
    }
  }

  static Future<File?> compressImage(File file,int quality) async {
    final tempDirectory = await getTemporaryDirectory();
    final outPath = '${tempDirectory.path}${basenameWithoutExtension(file.path)}_comp.jpg';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      outPath,
      quality: quality,
    );
    return result == null ? null : File(result.path);
  }

}
