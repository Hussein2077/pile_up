import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class GetPileFoldersUseCase {
  final BaseRepositoryCreatePile baseRepositoryCreatePile;

  GetPileFoldersUseCase({required this.baseRepositoryCreatePile});

  Future<Either<List<FolderModel>, Failure>> getPileFolders() async {
    final result = await baseRepositoryCreatePile.getFolders();

    return result;
  }
}