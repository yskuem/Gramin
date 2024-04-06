

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/exceptions/app_exception.dart';
import '../../../core/repositories/firebase_auth/firebase_auth_repository.dart';
import '../../app_user/entities/app_user.dart';
import '../../app_user/use_case/app_user_controller.dart';
part 'user_ranking_controller.g.dart';



@Riverpod(keepAlive: true)
Future<int> fetchAllUserCount(FetchAllUserCountRef ref) async {
  final snap = await FirebaseFirestore.instance
      .collection(AppUser.collectionPath)
      .count()
      .get();
  return snap.count ?? 0;
}


@riverpod
Future<int> fetchCurrentUserRanking(
    FetchCurrentUserRankingRef ref,
) async {
  final currentUser = await ref.read(appUserControllerProvider.future);
  final userId = ref.read(firebaseAuthRepositoryProvider).loggedInUserId;
  if (userId == null || currentUser == null) {
    throw AppException(title: 'ログインしてください');
  }
  final snap = await FirebaseFirestore.instance
      .collection(AppUser.collectionPath)
      .where('exPoint', isGreaterThan: currentUser.exPoint)
      .count()
      .get();
  final num = snap.count;
  if(num == null) {
    return 0;
  }
  final rank = num + 1;
  return rank;
}
