import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';

abstract class BaseRepositoryPilesImIn {
  Future<Either<List<PileImIn>, Failure>> getPilesImIn();
  Future<Either<List<PileImIn>, Failure>> getPilesImInBySearch(String pileName);
}