import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/calendar/data/model/calendar_model.dart';
import 'package:pile_up/features/calendar/domain/repository/calender_base_repo.dart';

class GetCalendarUseCase {
  final BaseRepositoryCalendar baseRepositoryCalendar;

  GetCalendarUseCase({required this.baseRepositoryCalendar});

  Future<Either<List<CalendarEvent>, Failure>> getCalendars() async {
    final result = await baseRepositoryCalendar.getCalendars();

    return result;
  }
}
