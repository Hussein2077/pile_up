
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';
import 'package:pile_up/features/home/domain/repository/home_carousel_base_repo.dart';

class GetNotificationsUseCase {
  final BaseRepositoryHomeCarousel baseRepositoryHomeCarousel;

  GetNotificationsUseCase({required this.baseRepositoryHomeCarousel});

  Future<Either<List<NotificationModel>, Failure>> getNotifications() async {
    final result = await baseRepositoryHomeCarousel.getNotifications();

    return result;
  }
}