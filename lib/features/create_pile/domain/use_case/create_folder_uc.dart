import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/create_folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/create_pile_base_repo.dart';

class CreateFolderUseCase {
  final BaseRepositoryCreatePile baseRepositoryCreateFolder;

  CreateFolderUseCase({required this.baseRepositoryCreateFolder});

  Future<Either<Map<String, dynamic>, Failure>> addCreateFolder(
      CreateFolderModel folder) async {
    final result = await baseRepositoryCreateFolder.addCreateFolder(folder);

    return result;
  }
}
