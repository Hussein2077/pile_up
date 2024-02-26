part of 'get_notifications_bloc.dart';

@immutable
abstract class GetNotificationsState extends Equatable {
const GetNotificationsState();

@override
List<Object> get props => [];
}

class GetNotificationsInitial extends GetNotificationsState {}

class GetNotificationsLoadingState extends GetNotificationsState{
  const GetNotificationsLoadingState();
}

class GetNotificationsErrorMessageState extends GetNotificationsState{
  final String errorMessage ;

  const GetNotificationsErrorMessageState({required this.errorMessage});
}

class GetNotificationsSuccessMessageState extends GetNotificationsState{
  final List<Notification> internModel ;

  const GetNotificationsSuccessMessageState({ required this.internModel});
}