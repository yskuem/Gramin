


import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
part 'up_load_converter.g.dart';


@Riverpod(keepAlive: true)
UpLoadConverter upLoadConverter(
    UpLoadConverterRef ref,
) {
  return UpLoadConverter();
}


class UpLoadConverter{
  Map<String, dynamic> toCreateDoc({
    required Map<String, dynamic> data,
  }) => <String, dynamic>{
    ...data,
    'createdAt': FieldValue.serverTimestamp(),
    'updatedAt': FieldValue.serverTimestamp(),
  };

  Map<String, dynamic> toUpdateDoc({
    required Map<String, dynamic> data,
    required DateTime? createdAt,
  }) => <String, dynamic>{
    ...data,
    'createdAt': createdAt ?? FieldValue.serverTimestamp(),
    'updatedAt': FieldValue.serverTimestamp(),
  };
}





