import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';

abstract class BaseRepositoryHomeCarousel {
  Future<Either<List<HomeCarousel>, Failure>> getHomeCarousel();
}
