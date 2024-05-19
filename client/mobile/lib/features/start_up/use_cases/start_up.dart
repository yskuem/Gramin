
import 'dart:io';

import 'package:flutter_app_template/core/exceptions/app_exception.dart';
import 'package:flutter_app_template/features/start_up/use_cases/update_check.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/repositories/firebase_auth/firebase_auth_repository.dart';
import '../../../core/use_cases/authentication/fetch_logged_in_type.dart';
import '../../../core/utils/image_operations.dart';
import '../../../core/utils/logger.dart';
import '../../../core/utils/random_user_id_generator.dart';
import '../../app_user/entities/app_user.dart';
import '../../app_user/use_case/app_user_controller.dart';
import 'sign_in_with_anonymously.dart';

part 'start_up.g.dart';

enum StartUpResultType {
  loginSuccess,
  noLogin,
  forcedVersionUpgrade,
}

@riverpod
class StartUpStateController extends _$StartUpStateController {
  @override
  Future<StartUpResultType> build() async {
    final loginType = ref.watch(fetchLoggedInTypeProvider)();
    logger.info(loginType);

    if (loginType == null) {
      return StartUpResultType.noLogin;
    }
    ref.read(appUserControllerProvider);

    final isUpdateNeeded = await ref.watch(isUpdateNeededProvider.future);

    if (isUpdateNeeded) {
      return StartUpResultType.forcedVersionUpgrade;
    }

    // TODO(yy): 強制バージョンアップを実装する場合はここで確認して StartUpResultType.forcedVersionUpgrade を返却する

    return StartUpResultType.loginSuccess;
  }

  Future<void> singInApp ({
    required String userName,
    required File? iconImage,
  }) async {
    state = await AsyncValue.guard(() async {
      await ref.read(signInWithAnonymouslyProvider)();
      final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
      if(userId == null){
        throw AppException.irregular();
      }

      String? iconUrl;
      if(iconImage != null) {
        final upLoadImage = await ImageOperations.compressImage(iconImage, 10);
        iconUrl = await ImageOperations.upLoadImage(userId, upLoadImage);
      }
      await ref.read(appUserControllerProvider.notifier).onCreate(
        AppUser(
          authId: userId,
          displayId: RandomUserIdGenerator.generateUserId(10),
          name: userName,
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
          iconUrl: iconUrl ?? defaultImageUrl,
        ),
      );
      return StartUpResultType.loginSuccess;
    });
  }
}
