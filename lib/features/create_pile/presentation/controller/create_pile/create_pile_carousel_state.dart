part of 'create_pile_carousel_bloc.dart';

@immutable
abstract class CreatePileState extends Equatable {
const CreatePileState();

@override
List<Object> get props => [];
}

class CreatePileInitial extends CreatePileState {}

class CreatePileLoadingState extends CreatePileState{
  const CreatePileLoadingState();
}

class CreatePileErrorMessageState extends CreatePileState{
  final String errorMessage ;

  const CreatePileErrorMessageState({required this.errorMessage});
}

class CreatePileSuccessMessageState extends CreatePileState{
  final Map<String, dynamic> internModel ;

  const CreatePileSuccessMessageState({ required this.internModel});
}class EditPileLoadingState extends CreatePileState{
  const EditPileLoadingState();
}

class EditPileErrorMessageState extends CreatePileState{
  final String errorMessage ;

  const EditPileErrorMessageState({required this.errorMessage});
}

class EditPileSuccessMessageState extends CreatePileState{
  final Map<String, dynamic> edit ;

  const EditPileSuccessMessageState({ required this.edit});
}
