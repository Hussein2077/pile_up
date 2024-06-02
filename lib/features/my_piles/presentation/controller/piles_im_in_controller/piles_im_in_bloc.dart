
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_piles/domain/use_case/piles_im_in_use_case.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_controller/piles_im_in_event.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_controller/piles_im_in_state.dart';

class GetPilesImInBloc extends Bloc<BaseGetPilesImInEvent, GetPilesImInState> {
  GetPilesImInUseCase getPilesImInUseCase;

  GetPilesImInBloc({required this.getPilesImInUseCase}) : super(GetPilesImInInitial()) {
    on<BaseGetPilesImInEvent>((event, emit) async {
      emit(const GetPilesImInLoadingState());
      final result = await getPilesImInUseCase.getPilesImIn();
      result.fold(
              (l) => emit(GetPilesImInSuccessMessageState(internModel: l)),
              (r) => emit(GetPilesImInErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
