
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_app_template/features/app_user/use_case/provide_target_user.dart';
import 'package:flutter_app_template/features/ranking/use_case/ranking_user_controller.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import '../../../core/exceptions/app_exception.dart';
import '../../app_user/entities/app_user.dart';
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
Future<int> fetchUserRanking(
    FetchUserRankingRef ref,
    {
      required String userId,
    }
) async {
  ref.watch(rankingUserControllerProvider);
  final currentUser = await ref.read(provideTargetUserProvider(userId: userId).future);
  if (currentUser == null) {
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
