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
  final String? confirmPassword;
  final String? name;
  final String? lastName;
  final String? major;
  final String? eduLevel;
  final String? graduationYear;

  const SignUpWithEmailAndPasswordEvent( {
      this.phone,
      this.email,
     this.password,
     this.name,
     this.lastName,
     this.major,
     this.eduLevel,
     this.graduationYear,
     this.confirmPassword,
  });
}
