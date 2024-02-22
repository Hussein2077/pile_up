
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/data/data_source/home_carousel_remote_data_source.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';


class HomeCarouselRepositoryImp extends BaseRepositoryHomeCarousel {
  final BaseRemotelyDataSourceHomeCarousel baseRemotelyDataSourceHomeCarousel;

  HomeCarouselRepositoryImp({required this.baseRemotelyDataSourceHomeCarousel});

  @override
  Future<Either<List<HomeCarousel>, Failure>> getHomeCarousel() async {
    try {
      final result = await baseRemotelyDataSourceHomeCarousel.getHomeCarousel();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}