import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/my_piles/data/model/folder_model.dart';
import 'package:pile_up/features/my_piles/data/model/my_piles_model.dart';

abstract class BaseRepositoryFolders {
  Future<Either<List<FolderModel>, Failure>> getFolders();
  Future<Either<Map<String, dynamic>, Failure>>deletePileManager(PileManager manager);
  Future<Either<Map<String, dynamic>, Failure>> addPileManager(PileManager manager);
}
