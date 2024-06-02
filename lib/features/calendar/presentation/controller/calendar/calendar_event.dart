import 'package:flutter/material.dart';

@immutable
abstract class BaseGetCalendarEvent {}

class InitEvent extends BaseGetCalendarEvent {}

class GetCalendarEvent extends BaseGetCalendarEvent {}