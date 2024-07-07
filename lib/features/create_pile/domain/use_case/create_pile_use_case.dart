import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class CreatePileUseCase {
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  CreatePileUseCase({required this.baseRepositoryCreatePile});

  Future<Either<Map<String, dynamic>, Failure>> createPile(CreateOrUpdatePile pile) async {
    final result = await baseRepositoryCreatePile.createPile(pile);

    return result;
  }
}
