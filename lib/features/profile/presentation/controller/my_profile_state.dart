part of 'my_profile_bloc.dart';

@immutable
abstract class GetMyProfileState extends Equatable{
  const GetMyProfileState();

  @override
  List<Object> get props => [];
}

class GetMyProfileInitial extends GetMyProfileState {}

class GetMyProfileLoadingState extends GetMyProfileState{
  const GetMyProfileLoadingState();
}

class GetMyProfileErrorMessageState extends GetMyProfileState{
  final String errorMessage ;

  const GetMyProfileErrorMessageState({required this.errorMessage});
}

class GetMyProfileSuccessMessageState extends GetMyProfileState{
  final List<MyProfile> internModel ;

  const GetMyProfileSuccessMessageState({ required this.internModel});
}