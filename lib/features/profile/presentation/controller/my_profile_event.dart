part of 'my_profile_bloc.dart';

@immutable
abstract class BaseGetMyProfileEvent {}

class InitEvent extends BaseGetMyProfileEvent {}

class GetMyProfileEvent extends BaseGetMyProfileEvent {}
class EditMyProfileEvent extends BaseGetMyProfileEvent {
  final String firstName;
  final String lastName;
  final String email;
  final int reminder;
  EditMyProfileEvent({ required this.firstName, required this.lastName, required this.email,required this.reminder});

}
