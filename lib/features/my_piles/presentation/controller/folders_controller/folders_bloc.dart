
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_piles/domain/use_case/get_folders_use_case.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_controller/folders_event.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_controller/folders_state.dart';

class GetFoldersBloc extends Bloc<BaseGetFoldersEvent, GetFoldersState> {
  GetFoldersUseCase getFoldersUseCase;

  GetFoldersBloc({required this.getFoldersUseCase}) : super(GetFoldersInitial()) {
    on<BaseGetFoldersEvent>((event, emit) async {
      emit(const GetFoldersLoadingState());
      final result = await getFoldersUseCase.getFolders();
      result.fold(
              (l) => emit(GetFoldersSuccessMessageState(internModel: l)),
              (r) => emit(GetFoldersErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
