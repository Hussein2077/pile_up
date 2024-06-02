part of 'get_notifications_bloc.dart';

@immutable
abstract class BaseGetNotificationsEvent {}

class InitEvent extends BaseGetNotificationsEvent {}

class GetHomeCarouseEvent extends BaseGetNotificationsEvent {}
