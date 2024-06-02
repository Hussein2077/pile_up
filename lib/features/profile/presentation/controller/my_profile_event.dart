part of 'my_profile_bloc.dart';

@immutable
abstract class BaseGetMyProfileEvent {}

class InitEvent extends BaseGetMyProfileEvent {}

class GetMyProfileEvent extends BaseGetMyProfileEvent {}
