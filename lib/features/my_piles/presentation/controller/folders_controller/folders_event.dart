import 'package:flutter/material.dart';

@immutable
abstract class BaseGetFoldersEvent {}

class InitEvent extends BaseGetFoldersEvent {}

class GetFoldersEvent extends BaseGetFoldersEvent {}
