import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/create_pile/data/model/user_folder_model.dart';

@immutable
abstract class GetTypesState extends Equatable {
  const GetTypesState();

  @override
  List<Object> get props => [];
}

class GetTypesInitial extends GetTypesState {}

class GetTypesLoadingState extends GetTypesState{
  const GetTypesLoadingState();
}

class GetTypesErrorMessageState extends GetTypesState{
  final String errorMessage ;

  const GetTypesErrorMessageState({required this.errorMessage});
}

class GetTypesSuccessMessageState extends GetTypesState{
  final List<UserFolder> internModel ;

  const GetTypesSuccessMessageState({ required this.internModel});
}