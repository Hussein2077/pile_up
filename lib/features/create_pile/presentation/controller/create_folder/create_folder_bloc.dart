import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_by_search_controller/folders_by_search_event.dart';
import 'package:pile_up/features/my_piles/presentation/controller/folders_by_search_controller/folders_by_search_state.dart';

import '../../../data/model/create_folder_model.dart';
import '../../../domain/use_case/create_folder_uc.dart';
import 'create_folder_event.dart';
import 'create_folder_state.dart';

class AddFolderBloc extends Bloc<AddFolderEvent, AddFolderState> {
  CreateFolderUseCase createFolderUseCase;

  AddFolderBloc({required this.createFolderUseCase})
      : super(AddFolderInitial()) {
    on<AddFolderEvent>((event, emit) async {
      emit(const AddFolderLoadingState());
      final result = await createFolderUseCase.addCreateFolder(
        CreateFolderModel(folderName: event.folderName),
      );
      result.fold(
          (l) => emit(
              AddFolderSuccessMessageState(folderInternModel: l['massage'])),
          (r) => emit(AddFolderErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
