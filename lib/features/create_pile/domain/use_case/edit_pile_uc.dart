import 'package:dartz/dartz.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class EditPileUseCase extends BaseUseCase<Map<String, dynamic>, CreateOrUpdatePile >{
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  EditPileUseCase({required this.baseRepositoryCreatePile});

  @override
  Future<Either<Map<String, dynamic>, Failure>> call(CreateOrUpdatePile parameter) async {
    final result = await baseRepositoryCreatePile.editPile(parameter);

    return result;
  }
}
