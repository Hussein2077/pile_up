import 'package:dartz/dartz.dart';
import 'package:pile_up/core/error/failure.dart';
import 'package:pile_up/features/calendar/data/model/calendar_model.dart';

abstract class BaseRepositoryCalendar {
  Future<Either<List<CalendarEvent>, Failure>> getCalendars();
}
