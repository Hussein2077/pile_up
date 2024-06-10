import 'package:flutter/material.dart';

@immutable
abstract class BaseGetTypesEvent {}

class InitEvent extends BaseGetTypesEvent {}

class GetTypesEvent extends BaseGetTypesEvent {}