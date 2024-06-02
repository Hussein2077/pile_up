import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/data/model/create_pile_model.dart';
import 'package:pile_up/features/create_pile/domain/use_case/create_pile_use_case.dart';

part 'create_pile_carousel_event.dart';

part 'create_pile_carousel_state.dart';

class CreatePileBloc extends Bloc<BaseCreatePileEvent, CreatePileState> {
  CreatePileUseCase createPileUseCase;

  CreatePileBloc({
    required this.createPileUseCase,
  }) : super(CreatePileInitial()) {
    on<CreatePileEvent>((event, emit) async {
      emit(const CreatePileLoadingState());
      final result = await createPileUseCase.createPile(
        CreatePile(
          userId: event.userId,
          folderId: event.folderId,
          pileName: event.pileName,
          description: event.description,
          ziad: event.ziad,
          eventDate: event.eventDate,
          deadlineDate: event.deadlineDate,
          creationDate: event.creationDate,
          totalAmount: event.totalAmount,
          participationAmount: event.participationAmount,
          status: event.status,
          pileImage: event.pileImage,
          categoryId: event.categoryId,
          collectedAmount: event.collectedAmount,
          totalCollectedPublic: event.totalCollectedPublic,
          showTotalRequired: event.showTotalRequired,
          payerListPublic: event.payerListPublic,
          exactAmountOrNot: event.exactAmountOrNot,
          allowPayerToLevMsg: event.allowPayerToLevMsg,
        ),
      );
      result.fold(
          (l) => emit(CreatePileSuccessMessageState(internModel: l)),
          (r) => emit(CreatePileErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
