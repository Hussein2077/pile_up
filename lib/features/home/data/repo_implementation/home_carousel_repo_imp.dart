
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/data/data_source/home_carousel_remote_data_source.dart';
import 'package:pile_up/features/home/data/model/address_book_model.dart';
import 'package:pile_up/features/home/data/model/blog_model.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';
import 'package:pile_up/features/home/data/model/merchant_model.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';
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
  @override
  Future<Either<List<NotificationModel>, Failure>> getNotifications() async {
    try {
      final result = await baseRemotelyDataSourceHomeCarousel.getNotifications();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<List<Merchant>, Failure>> getMerchants() async {
    try {
      final result = await baseRemotelyDataSourceHomeCarousel.getMerchants();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<List<BlogModel>, Failure>> getBlogs() async {
    try {
      final result = await baseRemotelyDataSourceHomeCarousel.getBlogs();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
  @override
  Future<Either<List<AddressBookModel>, Failure>> getAddressBook() async {
    try {
      final result = await baseRemotelyDataSourceHomeCarousel.getAddressBook();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}