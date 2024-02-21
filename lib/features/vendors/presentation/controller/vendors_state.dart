part of 'vendors_bloc.dart';

@immutable
abstract class GetVendorsState extends Equatable{
  const GetVendorsState();

  @override
  List<Object> get props => [];
}

class GetVendorsInitial extends GetVendorsState {}

class GetVendorsLoadingState extends GetVendorsState{
  const GetVendorsLoadingState();
}

class GetVendorsErrorMessageState extends GetVendorsState{
  final String errorMessage ;

  const GetVendorsErrorMessageState({required this.errorMessage});
}

class GetVendorsSuccessMessageState extends GetVendorsState{
  final List<Vendor> internModel ;

  const GetVendorsSuccessMessageState({ required this.internModel});
}