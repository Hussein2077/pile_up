
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_piles/data/model/piles_im_in.dart';
import 'package:pile_up/features/my_piles/domain/use_case/piles_im_in_by_search_uc.dart';
import 'package:pile_up/features/my_piles/domain/use_case/piles_im_in_use_case.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_controller/piles_im_in_event.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_controller/piles_im_in_state.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_search_controller/piles_im_in_event.dart';
import 'package:pile_up/features/my_piles/presentation/controller/piles_im_in_search_controller/piles_im_in_state.dart';

class GetPilesImInBySearchBloc extends Bloc<BaseGetPilesImInBySearchEvent, GetPilesImInBySearchState> {
  GetPilesImInBySearchUseCase getPilesImInBySearchUseCase;

  GetPilesImInBySearchBloc({required this.getPilesImInBySearchUseCase}) : super(GetPilesImInBySearchInitial()) {
    on<GetPilesImInBySearchEvent>((event, emit) async {
      emit(const GetPilesImInBySearchLoadingState());
      final result = await getPilesImInBySearchUseCase.getPilesImInBySearch(event.pileName);
      result.fold(
              (l) => emit(GetPilesImInBySearchSuccessMessageState(internModel: l)),
              (r) => emit(GetPilesImInBySearchErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
