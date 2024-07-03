import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/blog_model.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';

class GetBlogsUseCase {
  final BaseRepositoryHomeCarousel baseRepositoryBlogs;

  GetBlogsUseCase({required this.baseRepositoryBlogs});

  Future<Either<List<BlogModel>, Failure>> getBlogs() async {
    final result = await baseRepositoryBlogs.getBlogs();

    return result;
  }
}
