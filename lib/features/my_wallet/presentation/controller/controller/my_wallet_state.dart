part of 'my_wallet_bloc.dart';

@immutable
abstract class GetMyWalletState extends Equatable {
  const GetMyWalletState();

  @override
  List<Object> get props => [];
}

class GetMyWalletInitial extends GetMyWalletState {}

class GetMyWalletLoadingState extends GetMyWalletState{
  const GetMyWalletLoadingState();
}

class GetMyWalletErrorMessageState extends GetMyWalletState{
  final String errorMessage ;

  const GetMyWalletErrorMessageState({required this.errorMessage});
}

class GetMyWalletSuccessMessageState extends GetMyWalletState{
  final MyWalletModel internModel ;

  const GetMyWalletSuccessMessageState({ required this.internModel});
}