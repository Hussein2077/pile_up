import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/calendar/data/model/calendar_model.dart';

@immutable
abstract class GetCalendarState extends Equatable {
  const GetCalendarState();

  @override
  List<Object> get props => [];
}

class GetCalendarInitial extends GetCalendarState {}

class GetCalendarLoadingState extends GetCalendarState{
  const GetCalendarLoadingState();
}

class GetCalendarErrorMessageState extends GetCalendarState{
  final String errorMessage ;

  const GetCalendarErrorMessageState({required this.errorMessage});
}

class GetCalendarSuccessMessageState extends GetCalendarState{
  final List<CalendarEvent> internModel ;

  const GetCalendarSuccessMessageState({ required this.internModel});
}