import 'package:flutter/material.dart';

@immutable
abstract class BaseGetFoldersBySearchEvent {}

class InitEvent extends BaseGetFoldersBySearchEvent {}

class GetFoldersBySearchEvent extends BaseGetFoldersBySearchEvent {
  final String folderName;
  GetFoldersBySearchEvent({required this.folderName});
}
