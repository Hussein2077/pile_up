part of 'my_profile_bloc.dart';

@immutable
abstract class GetMyProfileState extends Equatable {
  const GetMyProfileState();

  @override
  List<Object> get props => [];
}

class GetMyProfileInitial extends GetMyProfileState {}

class GetMyProfileLoadingState extends GetMyProfileState {
  const GetMyProfileLoadingState();
}

class GetMyProfileErrorMessageState extends GetMyProfileState {
  final String errorMessage;

  const GetMyProfileErrorMessageState({required this.errorMessage});
}

class GetMyProfileSuccessMessageState extends GetMyProfileState {
  final MyProfile internModel;

  const GetMyProfileSuccessMessageState({required this.internModel});
}

class EditMyProfileSuccessMessageState extends GetMyProfileState {
  final String internModel;

  const EditMyProfileSuccessMessageState({required this.internModel});
}

class EditMyProfileErrorMessageState extends GetMyProfileState {
  final String errorMessage;

  const EditMyProfileErrorMessageState({required this.errorMessage});
}

class EditMyProfileLoadingState extends GetMyProfileState {
  const EditMyProfileLoadingState();
}
