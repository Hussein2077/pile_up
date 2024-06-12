import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class GetPilesImInUseCase {
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  GetPilesImInUseCase({required this.baseRepositoryCreatePile});

  Future<Either<List<Pile>, Failure>> getPilesImIn() async {
    final result = await baseRepositoryCreatePile.getPilesImIn();
    return result;
  }
}
