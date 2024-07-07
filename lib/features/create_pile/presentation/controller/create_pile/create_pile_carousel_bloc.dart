import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/domain/use_case/create_pile_use_case.dart';
import 'package:pile_up/features/create_pile/domain/use_case/edit_pile_uc.dart';

part 'create_pile_carousel_event.dart';

part 'create_pile_carousel_state.dart';

class CreatePileBloc extends Bloc<BaseCreatePileEvent, CreatePileState> {
  CreatePileUseCase createPileUseCase;
  EditPileUseCase editPileUseCase;

  CreatePileBloc({
    required this.createPileUseCase,
    required this.editPileUseCase,
  }) : super(CreatePileInitial()) {
    on<CreatePileEvent>((event, emit) async {
      emit(const CreatePileLoadingState());
      final result = await createPileUseCase.createPile(
        CreateOrUpdatePile(
          image: event.image,
          folderId: event.folderId,
          pileName: event.pileName,
          description: event.description,
          eventDate: event.eventDate,
          deadlineDate: event.deadlineDate,
          totalAmount: event.totalAmount,
          participationAmount: event.participationAmount,
          totalCollectedPublic: event.totalCollectedPublic,
          showTotalRequired: event.showTotalRequired,
          payerListPublic: event.payerListPublic,
          exactAmountOrNot: event.exactAmountOrNot,
          allowPayerToLevMsg: event.allowPayerToLevMsg,
          typeId: event.typeId,
        ),
      );
      result.fold(
          (l) => emit(CreatePileSuccessMessageState(internModel: l)),
          (r) => emit(CreatePileErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<EditPileEvent>((event, emit) async {
      emit(const EditPileLoadingState());
      final result = await editPileUseCase.call(
        CreateOrUpdatePile(
          image: event.image,
          folderId: event.folderId,
          pileName: event.pileName,
          description: event.description,
          eventDate: event.eventDate,
          deadlineDate: event.deadlineDate,
          totalAmount: event.totalAmount,
          participationAmount: event.participationAmount,
          totalCollectedPublic: event.totalCollectedPublic,
          showTotalRequired: event.showTotalRequired,
          payerListPublic: event.payerListPublic,
          exactAmountOrNot: event.exactAmountOrNot,
          allowPayerToLevMsg: event.allowPayerToLevMsg,
          typeId: event.typeId,
          pileId: event.pileId,
          pileStatus: event.pileStatus,
        ),
      );
      result.fold(
          (l) => emit(EditPileSuccessMessageState(edit: l)),
          (r) => emit(EditPileErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
