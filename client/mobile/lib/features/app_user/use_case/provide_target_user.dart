


import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/repositories/firebase_auth/firebase_auth_repository.dart';
import '../../ranking/use_case/ranking_user_controller.dart';
import '../entities/app_user.dart';
import 'app_user_controller.dart';
part 'provide_target_user.g.dart';

@riverpod
Future<AppUser?> provideTargetUser(//userIdからどのユーザかを特定する
    ProvideTargetUserRef ref,
    {
      required String userId,
    }
    ) async {
  ref
    ..watch(rankingUserControllerProvider)
    ..watch(appUserControllerProvider);
  final currentUserId = ref.watch(firebaseAuthRepositoryProvider).loggedInUserId;
  if(currentUserId == null) {
    throw AppException(title: 'ログインしてください');
  }
  if(currentUserId == userId) {
    final user = await ref.watch(appUserControllerProvider.future);
    return user;
  }
  final rankinUser = await ref.watch(rankingUserControllerProvider.future);
  final targetUser = rankinUser.firstWhere((element) => element.authId == userId);
  return targetUser;
}
