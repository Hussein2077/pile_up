import 'package:equatable/equatable.dart';

abstract class ResetPasswordState extends Equatable {
  const ResetPasswordState();

  @override
  List<Object> get props => [];
}

class ResetPasswordInitial extends ResetPasswordState {}





class VerifyCodeLoadingState extends ResetPasswordState {
  const VerifyCodeLoadingState();
}

class VerifyCodeErrorMessageState extends ResetPasswordState {
  final String errorMessage;

  const VerifyCodeErrorMessageState({required this.errorMessage});
}

class VerifyCodeSuccessMessageState extends ResetPasswordState {
  final String successMessage;

  const VerifyCodeSuccessMessageState({required this.successMessage});
}
