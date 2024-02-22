import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';

class GetHomeCarouselUseCase {
  final BaseRepositoryHomeCarousel baseRepositoryHomeCarousel;

  GetHomeCarouselUseCase({required this.baseRepositoryHomeCarousel});

  Future<Either<List<HomeCarousel>, Failure>> getHomeCarousel() async {
    final result = await baseRepositoryHomeCarousel.getHomeCarousel();

    return result;
  }
}
