import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

@immutable
abstract class GetUserFoldersState extends Equatable {
  const GetUserFoldersState();

  @override
  List<Object> get props => [];
}

class GetUserFoldersInitial extends GetUserFoldersState {}

class GetUserFoldersLoadingState extends GetUserFoldersState{
  const GetUserFoldersLoadingState();
}

class GetUserFoldersErrorMessageState extends GetUserFoldersState{
  final String errorMessage ;

  const GetUserFoldersErrorMessageState({required this.errorMessage});
}

class GetUserFoldersSuccessMessageState extends GetUserFoldersState{
  final List<UserFolder> internModel ;

  const GetUserFoldersSuccessMessageState({ required this.internModel});
}