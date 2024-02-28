import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/calendar/data/data_source/calendar_remote_data_source.dart';
import 'package:pile_up/features/calendar/data/model/calendar_model.dart';
import 'package:pile_up/features/calendar/domain/repository/calender_base_repo.dart';

class CalendarRepositoryImp extends BaseRepositoryCalendar {
  final BaseRemotelyDataSourceCalendar baseRemotelyDataSourceCalendar;

  CalendarRepositoryImp({required this.baseRemotelyDataSourceCalendar});

  @override
  Future<Either<List<CalendarEvent>, Failure>> getCalendars() async {
    try {
      final result = await baseRemotelyDataSourceCalendar.getCalendars();
      return Left(result);
    } on Exception catch (e) {
      return right(DioHelper.buildFailure(e));
    }
  }
}