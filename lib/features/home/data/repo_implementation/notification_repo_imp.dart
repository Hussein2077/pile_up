import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/data/data_source/notifications_remote_data_source.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';
import 'package:pile_up/features/home/domain/repository/notification_base_repo.dart';

class NotificationsRepositoryImp extends BaseRepositoryNotifications {
  final BaseRemotelyDataSourceNotifications baseRemotelyDataSourceNotifications;

  NotificationsRepositoryImp({required this.baseRemotelyDataSourceNotifications});

  @override
  Future<Either<List<Notification>, Failure>> getNotifications() async {
    try {
      final result = await baseRemotelyDataSourceNotifications.getNotifications();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}