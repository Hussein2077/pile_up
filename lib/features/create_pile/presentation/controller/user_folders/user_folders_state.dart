import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

@immutable
abstract class GetUserFoldersState extends Equatable {
  const GetUserFoldersState();

  @override
  List<Object> get props => [];
}

class GetBlogsInitial extends GetUserFoldersState {}

class GetBlogsLoadingState extends GetUserFoldersState{
  const GetBlogsLoadingState();
}

class GetBlogsErrorMessageState extends GetUserFoldersState{
  final String errorMessage ;

  const GetBlogsErrorMessageState({required this.errorMessage});
}

class GetBlogsSuccessMessageState extends GetUserFoldersState{
  final List<UserFolder> internModel ;

  const GetBlogsSuccessMessageState({ required this.internModel});
}