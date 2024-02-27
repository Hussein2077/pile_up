import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';

@immutable
abstract class GetPilesImInBySearchState extends Equatable {
  const GetPilesImInBySearchState();

  @override
  List<Object> get props => [];
}

class GetPilesImInBySearchInitial extends GetPilesImInBySearchState {}

class GetPilesImInBySearchLoadingState extends GetPilesImInBySearchState{
  const GetPilesImInBySearchLoadingState();
}

class GetPilesImInBySearchErrorMessageState extends GetPilesImInBySearchState{
  final String errorMessage ;

  const GetPilesImInBySearchErrorMessageState({required this.errorMessage});
}

class GetPilesImInBySearchSuccessMessageState extends GetPilesImInBySearchState{
  final List<PileImIn> internModel ;

  const GetPilesImInBySearchSuccessMessageState({ required this.internModel});
}