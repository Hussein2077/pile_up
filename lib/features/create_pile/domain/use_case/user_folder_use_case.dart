import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/user_folders_base_repo.dart';

class GetUserFoldersUseCase {
  final BaseRepositoryUserFolders baseRepositoryUserFolders;

  GetUserFoldersUseCase({required this.baseRepositoryUserFolders});

  Future<Either<List<UserFolder>, Failure>> getUserFolders() async {
    final result = await baseRepositoryUserFolders.getUserFolders();

    return result;
  }
}
