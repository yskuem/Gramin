
import 'package:flutter/material.dart';
import 'package:flutter_app_template/core/converters/up_load_converter.dart';
import 'package:flutter_app_template/core/repositories/firestore/document_repository.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/repositories/firebase_auth/firebase_auth_repository.dart';
import '../../../core/use_cases/authentication/auth_state_controller.dart';
import '../../quiz/entities/quiz.dart';
import '../entities/app_user.dart';
part 'app_user_controller.g.dart';


@riverpod
class AppUserController extends _$AppUserController {

  @override
  Future<AppUser?> build() async {
    /// ログアウト等でauthStateの状態が更新されたら発火されて新しいインスタンスを生成する
    ref.watch(authStateControllerProvider);
    final appUser = await onFetch();
    return appUser;
  }


  Future<AppUser?> onFetch() async {
    final userId = ref.watch(firebaseAuthRepositoryProvider).loggedInUserId;
    if (userId == null) {
      throw AppException(title: 'ログインしてください');
    }
    final doc = await ref.watch(documentRepositoryProvider).fetch<AppUser>(
        AppUser.docPath(userId),
        decode: AppUser.fromJson,
    );
    final appUser = doc.entity;
    state = AsyncData(appUser);
    return appUser;
  }


  Future<void> onCreate(AppUser newUser) async {
    state = await AsyncValue.guard(() async {
      await ref.read(documentRepositoryProvider).save(
        AppUser.docPath(newUser.authId),
        data: ref.read(upLoadConverterProvider).toCreateDoc(data: newUser.toJson()),
      );
      return newUser;
    });
  }


  Future<void> onUpdate (AppUser updateUser) async {
    state = await AsyncValue.guard(() async {
      await ref.read(documentRepositoryProvider).update(
          AppUser.docPath(updateUser.authId),
          data: ref.read(upLoadConverterProvider).toUpdateDoc(
              data: updateUser.toJson(),
              createdAt: updateUser.createdAt,
          ),
      );
      return updateUser;
    });
  }


  Future<void> userStateUpdate ({
    required Quiz quiz,
    required ValueNotifier<bool?> isCorrect,
  }) async {
    final isCorrectValue = isCorrect.value;
    final currentUser = await future;
    if(currentUser == null || isCorrectValue == null) {
      throw AppException.irregular();
    }
    final updatedUser = currentUser.copyWith(
      lastAnsweredQuizCreatedAt: quiz.createdAt ?? currentUser.lastAnsweredQuizCreatedAt,
      correctCount: isCorrectValue ? currentUser.correctCount + 1 : currentUser.correctCount,
      inCorrectCount: isCorrectValue ? currentUser.inCorrectCount : currentUser.inCorrectCount + 1,
      consecutiveCorrects: isCorrectValue ? currentUser.consecutiveCorrects + 1 : 0,
      maxConsecutiveCorrects: currentUser.consecutiveCorrects + 1 > currentUser.maxConsecutiveCorrects
          ? currentUser.consecutiveCorrects + 1
          : currentUser.maxConsecutiveCorrects,
    );
    await onUpdate(updatedUser);
  }
}






