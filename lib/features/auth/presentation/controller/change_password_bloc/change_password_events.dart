
import 'package:equatable/equatable.dart';

abstract class BaseChangePasswordEvent extends Equatable {
  const BaseChangePasswordEvent();

  @override
  List<Object> get props => [];
}

class VerifyCodeEvent extends BaseChangePasswordEvent{
  final String email ;
  final String code ;
  const VerifyCodeEvent({  required this.email,required this.code});
}
