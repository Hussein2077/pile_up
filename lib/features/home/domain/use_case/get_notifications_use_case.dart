
import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';
import 'package:pile_up/features/home/domain/repository/notification_base_repo.dart';

class GetNotificationsUseCase {
  final BaseRepositoryNotifications baseRepositoryNotifications;

  GetNotificationsUseCase({required this.baseRepositoryNotifications});

  Future<Either<List<Notification>, Failure>> getNotifications() async {
    final result = await baseRepositoryNotifications.getNotifications();

    return result;
  }
}