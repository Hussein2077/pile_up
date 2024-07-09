
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/domain/use_case/getParticipants_uc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/getParticipants/piles_im_in_state.dart';
import 'package:pile_up/features/create_pile/presentation/controller/piles_im_in_controller/piles_im_in_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/piles_im_in_controller/piles_im_in_state.dart';
import 'package:pile_up/features/create_pile/domain/use_case/piles_im_in_use_case.dart';

class GetParticipantBloc extends Bloc<BaseGetParticipantEvent, GetParticipantState> {
  GetParticipantUseCase getParticipantUseCase;

  GetParticipantBloc({required this.getParticipantUseCase}) : super(GetParticipantInitial()) {
    on<GetParticipantEvent>((event, emit) async {
      emit(const GetParticipantLoadingState());
      final result = await getParticipantUseCase.call(event.pileId);
      result.fold(
              (l) => emit(GetParticipantSuccessMessageState(internModel: l)),
              (r) => emit(GetParticipantErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
