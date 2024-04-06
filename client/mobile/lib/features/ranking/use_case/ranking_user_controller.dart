
import 'package:flutter_app_template/features/app_user/entities/app_user.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

import '../../../core/repositories/firestore/collection_paging_repository.dart';
import '../../quiz/constants/constants.dart';
part 'ranking_user_controller.g.dart';


@Riverpod(keepAlive: true)
CollectionPagingRepository<AppUser> rankingUserCollectionPagingRepository(
    RankingUserCollectionPagingRepositoryRef ref,
    CollectionParam<AppUser> query,
    ) {
  return CollectionPagingRepository<AppUser>(
    query: query.query,
    initialLimit: query.initialLimit,
    pagingLimit: query.pagingLimit,
    decode: query.decode,
  );
}


@riverpod
class RankingUserController extends _$RankingUserController {

  CollectionPagingRepository<AppUser>? _collectionPagingRepository;

  @override
  Future<List<AppUser>> build() async {
    final repository = ref.watch(
      rankingUserCollectionPagingRepositoryProvider(
        CollectionParam<AppUser>(
          query: AppUser.colRef().orderBy('exPoint',descending: true),
          initialLimit: initialLimitCount,
          pagingLimit: pagingLimitCount,
          decode: AppUser.fromJson,
        ),
      ),
    );
    _collectionPagingRepository = repository;
    final documentList = await repository.fetch();
    final userList = documentList.map((document) => document.entity).whereType<AppUser>().toList();
    return userList;
  }


  Future<void> updateRankingUser ({required AppUser user}) async{
    final currentList = await future;
    final newList = currentList.map((rankingUser) {
      if(rankingUser.authId == user.authId){
        return user;
      } else {
        return rankingUser;
      }
    }).toList();
    final sortUpdateList = newList..sort((a,b) => b.exPoint.compareTo(a.exPoint));
    state = AsyncData(sortUpdateList);
  }
}




