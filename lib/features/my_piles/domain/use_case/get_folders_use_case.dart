import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/my_piles/data/model/my_piles_model.dart';
import 'package:pile_up/features/my_piles/domain/repository/folder_base_repo.dart';

class GetFoldersUseCase {
  final BaseRepositoryFolders baseRepositoryFolders;

  GetFoldersUseCase({required this.baseRepositoryFolders});

  Future<Either<Map<String, dynamic>, Failure>> deletePileManager(PileManager manager) async {
    final result = await baseRepositoryFolders.deletePileManager(manager);
    return result;
  }
  Future<Either<Map<String, dynamic>, Failure>> addPileManager(PileManager manager) async {
    final result = await baseRepositoryFolders.addPileManager(manager);
    return result;
  }
}
