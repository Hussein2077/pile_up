
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';
import 'package:pile_up/features/my_piles/domain/repository/piles_im_in_base_repo.dart';

class GetPilesImInBySearchUseCase {
  final BaseRepositoryPilesImIn baseRepositoryPilesImIn;

  GetPilesImInBySearchUseCase({required this.baseRepositoryPilesImIn});

  Future<Either<List<PileImIn>, Failure>> getPilesImInBySearch(String pileName) async {
    final result = await baseRepositoryPilesImIn.getPilesImInBySearch(pileName);
    return result;
  }
}