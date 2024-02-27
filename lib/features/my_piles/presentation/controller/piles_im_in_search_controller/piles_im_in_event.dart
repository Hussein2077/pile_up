import 'package:flutter/material.dart';

@immutable
abstract class BaseGetPilesImInBySearchEvent {}

class InitEvent extends BaseGetPilesImInBySearchEvent {}

class GetPilesImInBySearchEvent extends BaseGetPilesImInBySearchEvent {
  final String pileName;
  GetPilesImInBySearchEvent({required this.pileName});
}
