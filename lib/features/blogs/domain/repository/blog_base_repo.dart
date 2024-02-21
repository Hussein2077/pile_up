import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/blogs/data/model/blog_model.dart';

abstract class BaseRepositoryBlogs {
  Future<Either<List<BlogModel>, Failure>> getBlogs();
}
