import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_piles/domain/use_case/get_folders_by_search_uc.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_by_search_controller/folders_by_search_event.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_by_search_controller/folders_by_search_state.dart';

class GetFoldersBySearchBloc extends Bloc<BaseGetFoldersBySearchEvent, GetFoldersBySearchState> {
  GetFoldersBySearchUseCase getFoldersBySearchUseCase;

  GetFoldersBySearchBloc({required this.getFoldersBySearchUseCase}) : super(GetFoldersBySearchInitial()) {
    on<GetFoldersBySearchEvent>((event, emit) async {
      emit(const GetFoldersBySearchLoadingState());
      final result = await getFoldersBySearchUseCase.getFoldersBySearch(event.folderName);
      result.fold(
              (l) => emit(GetFoldersBySearchSuccessMessageState(internModel: l)),
              (r) => emit(GetFoldersBySearchErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
