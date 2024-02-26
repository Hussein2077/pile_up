import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_piles/data/model/folder_model.dart';

abstract class BaseRepositoryFolders {
  Future<Either<List<FolderModel>, Failure>> getFolders();
}
