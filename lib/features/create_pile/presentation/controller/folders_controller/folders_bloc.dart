
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/domain/use_case/pile_by_folder_uc.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/folders_controller/folders_state.dart';
import 'package:pile_up/features/my_piles/domain/use_case/get_folders_use_case.dart';

class GetFoldersBloc extends Bloc<BaseGetFoldersEvent, GetFoldersState> {
  GetPileFoldersUseCase getFoldersUseCase;

  GetFoldersBloc({required this.getFoldersUseCase}) : super(GetFoldersInitial()) {
    on<GetFoldersEvent>((event, emit) async {
      emit(const GetFoldersLoadingState());
      final result = await getFoldersUseCase.getPileFolders();
      result.fold(
              (l) => emit(GetFoldersSuccessMessageState(folderModel: l)),
              (r) => emit(GetFoldersErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
