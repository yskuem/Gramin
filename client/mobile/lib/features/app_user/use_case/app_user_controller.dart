
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/repositories/firestore/collection_paging_repository.dart';
import '../entities/app_user.dart';
part 'app_user_controller.g.dart';
@riverpod
CollectionPagingRepository<AppUser> appUserCollectionPagingRepository(
    AppUserCollectionPagingRepositoryRef ref,
    CollectionParam<AppUser> query,
    ) {
  return CollectionPagingRepository<AppUser>(
    query: query.query,
    initialLimit: query.initialLimit,
    pagingLimit: query.pagingLimit,
    decode: query.decode,
  );
}

// @riverpod
// class AppUserController extends _$AppUserController {
//
//   @override
//   Future<List<AppUser>> build() async {
//     /// ログアウト等でauthStateの状態が更新されたら発火されて新しいインスタンスを生成する
//     ref.watch(authStateControllerProvider);
//     final userId = ref.watch(firebaseAuthRepositoryProvider).loggedInUserId;
//   }
//
//
//   Future<AppUser> onFetch() async {
//
//   }
// }


