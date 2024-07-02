import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';

import '../../../data/model/create_folder_model.dart';

@immutable
abstract class AddFolderState extends Equatable {
  const AddFolderState();

  @override
  List<Object> get props => [];
}

class AddFolderInitial extends AddFolderState {}

class AddFolderLoadingState extends AddFolderState{
  const AddFolderLoadingState();
}

class AddFolderErrorMessageState extends AddFolderState{
  final String errorMessage ;

  const AddFolderErrorMessageState({required this.errorMessage});
}

class AddFolderSuccessMessageState extends AddFolderState{
  final List<CreateFolderModel> folderInternModel ;

  const AddFolderSuccessMessageState({ required this.folderInternModel});
}