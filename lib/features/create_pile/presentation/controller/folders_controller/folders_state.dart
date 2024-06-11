import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/create_pile/data/model/folder_model.dart';

@immutable
abstract class GetFoldersState extends Equatable {
  const GetFoldersState();

  @override
  List<Object> get props => [];
}

class GetFoldersInitial extends GetFoldersState {}

class GetFoldersLoadingState extends GetFoldersState{
  const GetFoldersLoadingState();
}

class GetFoldersErrorMessageState extends GetFoldersState{
  final String errorMessage ;

  const GetFoldersErrorMessageState({required this.errorMessage});
}

class GetFoldersSuccessMessageState extends GetFoldersState{
  final List<FolderModel> folderModel ;

  const GetFoldersSuccessMessageState({ required this.folderModel});
}