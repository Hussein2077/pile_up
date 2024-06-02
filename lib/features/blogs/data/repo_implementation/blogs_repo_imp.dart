
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/blogs/data/data_source/blogs_remote_data_source.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';

class BlogsRepositoryImp extends BaseRepositoryBlogs {
  final BaseRemotelyDataSourceBlogs baseRemotelyDataSourceBlogs;

  BlogsRepositoryImp({required this.baseRemotelyDataSourceBlogs});

  @override
  Future<Either<List<BlogModel>, Failure>> getBlogs() async {
    try {
      final result = await baseRemotelyDataSourceBlogs.getBlogs();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}