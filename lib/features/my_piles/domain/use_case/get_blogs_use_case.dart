import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';
import 'package:pile_up/features/blogs/domain/repository/blog_base_repo.dart';

class GetBlogsUseCase {
  final BaseRepositoryBlogs baseRepositoryBlogs;

  GetBlogsUseCase({required this.baseRepositoryBlogs});

  Future<Either<List<BlogModel>, Failure>> getBlogs() async {
    final result = await baseRepositoryBlogs.getBlogs();

    return result;
  }
}
