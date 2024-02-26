part of 'my_wallet_bloc.dart';

@immutable
abstract class BaseGetMyWalletEvent {}

class InitEvent extends BaseGetMyWalletEvent {}

class GetMyWalletEvent extends BaseGetMyWalletEvent {}
