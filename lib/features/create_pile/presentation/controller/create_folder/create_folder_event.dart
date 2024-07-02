import 'package:flutter/material.dart';

@immutable
abstract class BaseAddFolderEvent {}

class InitEvent extends BaseAddFolderEvent {}

class AddFolderEvent extends BaseAddFolderEvent {
  final String folderName;
  AddFolderEvent({required this.folderName});
}
