
import 'package:equatable/equatable.dart';
import 'package:pile_up/features/home/data/model/merchant_model.dart';

abstract class GetMerchantsState extends Equatable {
  const GetMerchantsState();

  @override
  List<Object> get props => [];
}

class GetMerchantsInitial extends GetMerchantsState {}

class GetMerchantsLoadingState extends GetMerchantsState{
  const GetMerchantsLoadingState();
}

class GetMerchantsErrorMessageState extends GetMerchantsState{
  final String errorMessage ;

  const GetMerchantsErrorMessageState({required this.errorMessage});
}

class GetMerchantsSuccessMessageState extends GetMerchantsState{
  final List<Merchant> internModel ;

  const GetMerchantsSuccessMessageState({ required this.internModel});
}