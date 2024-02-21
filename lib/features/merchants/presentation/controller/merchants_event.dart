part of 'merchants_bloc.dart';

@immutable
abstract class BaseGetMerchantsEvent {}

class InitEvent extends BaseGetMerchantsEvent {}

class GetMerchantsEvent extends BaseGetMerchantsEvent {}
