import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/my_piles/domain/repository/folder_base_repo.dart';

class GetFoldersBySearchUseCase {
  final BaseRepositoryFolders baseRepositoryFolders;

  GetFoldersBySearchUseCase({required this.baseRepositoryFolders});

  Future<Either<List<FolderModel>, Failure>> getFoldersBySearch(String folderName) async {
    final result = await baseRepositoryFolders.getFoldersBySearch(folderName);
    return result;
  }
}