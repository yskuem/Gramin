

import 'dart:io';

import 'package:firebase_storage/firebase_storage.dart';
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

  static Future<File> compressImage(File file,int quality) async { //圧縮失敗したら元のファイルを返す
    final tempDirectory = await getTemporaryDirectory();
    final outPath = '${tempDirectory.path}${basenameWithoutExtension(file.path)}_comp.jpg';
    final result = await FlutterImageCompress.compressAndGetFile(
      file.path,
      outPath,
      quality: quality,
    );
    return result == null ? file : File(result.path);
  }


  static Future<String> upLoadImage(String uid, File image) async {
    final storageInstance = FirebaseStorage.instance;
    final ref = storageInstance.ref();
    await ref.child(uid).putFile(File(image.path));//uidが画像のファイル名
    final downloadUrl = await storageInstance.ref(uid).getDownloadURL(); //アップロードしたURLを取得
    return downloadUrl;
  }

}
