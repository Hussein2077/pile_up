import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/domain/use_case/user_folder_use_case.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/user_folders/user_folders_state.dart';

class GetUserFoldersBloc extends Bloc<BaseGetUserFoldersEvent, GetUserFoldersState> {
  GetUserFoldersUseCase getUserFoldersUseCase;
  GetUserFoldersBloc({required this.getUserFoldersUseCase}) : super(GetUserFoldersInitial()) {
    on<BaseGetUserFoldersEvent>((event, emit) async {
      emit(const GetUserFoldersLoadingState());
      final result = await getUserFoldersUseCase.getUserFolders();
      result.fold(
              (l) {
                emit(GetUserFoldersSuccessMessageState(internModel: l));
              },
              (r) => emit(GetUserFoldersErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }

}
