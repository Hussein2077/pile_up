import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

abstract class BaseRepositoryCreatePile {
  Future <Either<Map<String, dynamic>, Failure>> createPile(CreatePile pile);
  Future<Either<List<UserFolder>, Failure>> getUserFolders();
  Future<Either<List<UserFolder>, Failure>> getTypes();
  Future<Either<List<FolderModel>, Failure>> getFolders();
}
