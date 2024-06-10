import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class GetUserFoldersUseCase {
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  GetUserFoldersUseCase({required this.baseRepositoryCreatePile});

  Future<Either<List<UserFolder>, Failure>> getUserFolders() async {
    final result = await baseRepositoryCreatePile.getUserFolders();

    return result;
  }
}
class GetTypesUseCase {
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  GetTypesUseCase({required this.baseRepositoryCreatePile});

  Future<Either<List<UserFolder>, Failure>> getTypes() async {
    final result = await baseRepositoryCreatePile.getTypes();

    return result;
  }
}
