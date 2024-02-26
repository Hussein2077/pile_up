

import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';

abstract class BaseRepositoryNotifications {
  Future<Either<List<Notification>, Failure>> getNotifications();
}