import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/data/data_source/user_folder_remote_data_source.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';
import 'package:pile_up/features/create_pile/domain/repository/user_folders_base_repo.dart';

class UserFoldersRepositoryImp extends BaseRepositoryUserFolders {
  final BaseRemotelyDataSourceUserFolders baseRemotelyDataSourceUserFolders;

  UserFoldersRepositoryImp({required this.baseRemotelyDataSourceUserFolders});

  @override
  Future<Either<List<UserFolder>, Failure>> getUserFolders() async {
    try {
      final result = await baseRemotelyDataSourceUserFolders.getUserFolders();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}