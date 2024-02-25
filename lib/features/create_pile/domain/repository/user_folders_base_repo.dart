import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

abstract class BaseRepositoryUserFolders {
  Future<Either<List<UserFolder>, Failure>> getUserFolders();
}
