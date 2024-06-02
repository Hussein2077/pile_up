import 'package:flutter/material.dart';

@immutable
abstract class BaseGetUserFoldersEvent {}

class InitEvent extends BaseGetUserFoldersEvent {}

class GetUserFoldersEvent extends BaseGetUserFoldersEvent {}