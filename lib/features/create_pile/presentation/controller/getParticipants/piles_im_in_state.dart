import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:pile_up/features/create_pile/data/model/Participant.dart';


@immutable
abstract class GetParticipantState extends Equatable {
  const GetParticipantState();

  @override
  List<Object> get props => [];
}

class GetParticipantInitial extends GetParticipantState {}

class GetParticipantLoadingState extends GetParticipantState{
  const GetParticipantLoadingState();
}

class GetParticipantErrorMessageState extends GetParticipantState{
  final String errorMessage ;

  const GetParticipantErrorMessageState({required this.errorMessage});
}

class GetParticipantSuccessMessageState extends GetParticipantState{
  final List<Participant> internModel ;

  const GetParticipantSuccessMessageState({ required this.internModel});
}