import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_piles/data/data_source/piles_im_in_remote_data_source.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';
import 'package:pile_up/features/my_piles/domain/repository/piles_im_in_base_repo.dart';

class PilesImInRepositoryImp extends BaseRepositoryPilesImIn {
  final BaseRemotelyDataSourcePilesImIn baseRemotelyDataSourcePilesImIn;

  PilesImInRepositoryImp({required this.baseRemotelyDataSourcePilesImIn});

  @override
  Future<Either<List<PileImIn>, Failure>> getPilesImIn() async {
    try {
      final result = await baseRemotelyDataSourcePilesImIn.getPilesImIn();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}