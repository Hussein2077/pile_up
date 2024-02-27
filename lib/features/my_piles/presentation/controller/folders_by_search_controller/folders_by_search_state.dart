import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/my_piles/data/model/folder_model.dart';

@immutable
abstract class GetFoldersBySearchState extends Equatable {
  const GetFoldersBySearchState();

  @override
  List<Object> get props => [];
}

class GetFoldersBySearchInitial extends GetFoldersBySearchState {}

class GetFoldersBySearchLoadingState extends GetFoldersBySearchState{
  const GetFoldersBySearchLoadingState();
}

class GetFoldersBySearchErrorMessageState extends GetFoldersBySearchState{
  final String errorMessage ;

  const GetFoldersBySearchErrorMessageState({required this.errorMessage});
}

class GetFoldersBySearchSuccessMessageState extends GetFoldersBySearchState{
  final List<FolderModel> internModel ;

  const GetFoldersBySearchSuccessMessageState({ required this.internModel});
}