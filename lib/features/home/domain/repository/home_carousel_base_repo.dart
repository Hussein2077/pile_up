import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/blog_model.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';
import 'package:pile_up/features/home/data/model/merchant_model.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';

abstract class BaseRepositoryHomeCarousel {
  Future<Either<List<HomeCarousel>, Failure>> getHomeCarousel();
  Future<Either<List<NotificationModel>, Failure>> getNotifications();
  Future<Either<List<Merchant>, Failure>> getMerchants();
  Future<Either<List<BlogModel>, Failure>> getBlogs();


}
