import 'package:equatable/equatable.dart';

abstract class BaseSignUpWithEmailAndPasswordEvent extends Equatable {
  const BaseSignUpWithEmailAndPasswordEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordEvent
    extends BaseSignUpWithEmailAndPasswordEvent {
  final String? phone;
  final String? email;
  final String? password;
  final String? name;
  final String? lastName;

  const SignUpWithEmailAndPasswordEvent( {
      this.phone,
      this.email,
     this.password,
     this.name,
     this.lastName,
  });
}
