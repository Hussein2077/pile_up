import 'package:equatable/equatable.dart';

abstract class BaseSignUpWithEmailAndPasswordEvent extends Equatable {
  const BaseSignUpWithEmailAndPasswordEvent();

  @override
  List<Object> get props => [];
}

class SignUpWithEmailAndPasswordEvent
    extends BaseSignUpWithEmailAndPasswordEvent {
  final String phone;
  final String email;

  final String password;

  final String? name;
  final String? dateOfBirth;
  final String? eduLevel;
  final String? gradLevel;
  final String? university;
  final String? major;

  const SignUpWithEmailAndPasswordEvent({
    required this.phone,
    required this.email,
    required this.password,
    this.name,
    this.dateOfBirth,
    this.eduLevel,
    this.gradLevel,
    this.university,
    this.major,
  });
}
