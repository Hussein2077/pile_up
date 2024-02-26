
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/blogs/data/data_source/blogs_remote_data_source.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';
import 'package:pile_up/features/my_piles/data/data_source/folders_remote_data_source.dart';
import 'package:pile_up/features/my_piles/data/model/folder_model.dart';
import 'package:pile_up/features/my_piles/domain/repository/folder_base_repo.dart';

class FoldersRepositoryImp extends BaseRepositoryFolders {
  final BaseRemotelyDataSourceFolders baseRemotelyDataSourceFolders;

  FoldersRepositoryImp({required this.baseRemotelyDataSourceFolders});

  @override
  Future<Either<List<FolderModel>, Failure>> getFolders() async {
    try {
      final result = await baseRemotelyDataSourceFolders.getFolders();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}