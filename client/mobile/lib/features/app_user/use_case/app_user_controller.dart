
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
        data: newUser.copyWith(
          createdAt: DateTime.now(),
          updatedAt: DateTime.now(),
        ).toJson()
      );
      return newUser;
    });
  }


  Future<void> onUpdate (AppUser updateUser) async {
    state = await AsyncValue.guard(() async {
      await ref.read(documentRepositoryProvider).update(
          AppUser.docPath(updateUser.authId),
          data: updateUser.copyWith(
            updatedAt: DateTime.now(),
          ).toJson(),
      );
      return updateUser;
    });
  }


  Future<AppUser> userStateUpdate ({
    required Quiz quiz,
    required bool? isCorrect,
  }) async {
    final currentUser = await future;
    if(currentUser == null || isCorrect == null) {
      throw AppException.irregular();
    }
    final updatedUser = currentUser.copyWith(
      lastAnsweredQuizCreatedAt: quiz.createdAt,
      correctCount: isCorrect ? currentUser.correctCount + 1 : currentUser.correctCount,
      inCorrectCount: isCorrect ? currentUser.inCorrectCount : currentUser.inCorrectCount + 1,
      consecutiveCorrects: isCorrect ? currentUser.consecutiveCorrects + 1 : 0,
      maxConsecutiveCorrects: currentUser.consecutiveCorrects + 1 > currentUser.maxConsecutiveCorrects && isCorrect
          ? currentUser.consecutiveCorrects + 1
          : currentUser.maxConsecutiveCorrects,
      exPoint: calcUserExp(isCorrect: isCorrect, appUser: currentUser),
    );
    await onUpdate(updatedUser);
    return updatedUser;
  }

  int calcUserExp({
    required bool isCorrect,
    required AppUser appUser,
  }) {
    final currentExp = appUser.exPoint;
    final correctPoint = isCorrect ? 2 : -1;
    final consecutivePoint = appUser.consecutiveCorrects + 1 > appUser.maxConsecutiveCorrects && isCorrect
        ? 2
        : 0;
    return currentExp + correctPoint + consecutivePoint;
  }
}






