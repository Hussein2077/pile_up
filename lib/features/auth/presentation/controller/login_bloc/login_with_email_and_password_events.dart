
import 'package:equatable/equatable.dart';

abstract class BaseLoginWithEmailAndPasswordEvent extends Equatable {
  const BaseLoginWithEmailAndPasswordEvent();

  @override
  List<Object> get props => [];
}
class LoginWithEmailAndPasswordEvent extends BaseLoginWithEmailAndPasswordEvent{

  final String phone ;


  const LoginWithEmailAndPasswordEvent({ required this.phone});


}