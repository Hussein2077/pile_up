import 'package:equatable/equatable.dart';
import 'package:pile_up/core/models/my_data_model.dart';
import 'package:pile_up/features/auth/data/auth_remote_data_source.dart';


abstract class SignInWithPlatformState extends Equatable {
  const SignInWithPlatformState();

  @override
  List<Object> get props => [];
}

class SignInWithPlatformInitial extends SignInWithPlatformState {}

class SignWithPlatFormLoadingState extends SignInWithPlatformState{
  const SignWithPlatFormLoadingState();
}
class SignWithGoogleErrorMessageState extends SignInWithPlatformState{
  final String errorMessage ;

  const SignWithGoogleErrorMessageState({required this.errorMessage});


}
class SignWithGoogleSuccesMessageState extends SignInWithPlatformState{
  final AuthWithGoogleModel userData ;

  final String userId ;

  const SignWithGoogleSuccesMessageState({  required this.userId,  required this.userData ,});

}

class SignWithAppleErrorMessageState extends SignInWithPlatformState{
  final String errorMessage ;

  const SignWithAppleErrorMessageState({required this.errorMessage});


}
class SignWithAppleSuccesMessageState extends SignInWithPlatformState{
  final AuthWithAppleModel userData ;
  final String userId ;

  const SignWithAppleSuccesMessageState({  required this.userId,  required this.userData ,});

}
