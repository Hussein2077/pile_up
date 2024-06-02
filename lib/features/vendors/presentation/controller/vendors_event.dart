part of 'vendors_bloc.dart';

@immutable
abstract class BaseGetVendorsEvent {}

class InitEvent extends BaseGetVendorsEvent {}

class GetVendorsEvent extends BaseGetVendorsEvent {}