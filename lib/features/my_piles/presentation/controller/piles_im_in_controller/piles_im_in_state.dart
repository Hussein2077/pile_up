import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';

@immutable
abstract class GetPilesImInState extends Equatable {
  const GetPilesImInState();

  @override
  List<Object> get props => [];
}

class GetPilesImInInitial extends GetPilesImInState {}

class GetPilesImInLoadingState extends GetPilesImInState{
  const GetPilesImInLoadingState();
}

class GetPilesImInErrorMessageState extends GetPilesImInState{
  final String errorMessage ;

  const GetPilesImInErrorMessageState({required this.errorMessage});
}

class GetPilesImInSuccessMessageState extends GetPilesImInState{
  final List<PileImIn> internModel ;

  const GetPilesImInSuccessMessageState({ required this.internModel});
}