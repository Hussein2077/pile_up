import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';

@immutable
abstract class AddFolderState extends Equatable {
  const AddFolderState();

  @override
  List<Object> get props => [];
}

class AddFolderInitial extends AddFolderState {}

class AddFolderLoadingState extends AddFolderState {
  const AddFolderLoadingState();
}

class AddFolderErrorMessageState extends AddFolderState {
  final String errorMessage;

  const AddFolderErrorMessageState({required this.errorMessage});
}

class AddFolderSuccessMessageState extends AddFolderState {
  final Map<String, dynamic> folderInternModel;

  const AddFolderSuccessMessageState({required this.folderInternModel});
}
