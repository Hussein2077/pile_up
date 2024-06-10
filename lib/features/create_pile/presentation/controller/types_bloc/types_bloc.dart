import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/create_pile/domain/use_case/user_folder_use_case.dart';
import 'package:pile_up/features/create_pile/presentation/controller/types_bloc/types_event.dart';
import 'package:pile_up/features/create_pile/presentation/controller/types_bloc/types_state.dart';

class GetTypesBloc extends Bloc<BaseGetTypesEvent, GetTypesState> {
  GetTypesUseCase getTypesUseCase;
  GetTypesBloc({required this.getTypesUseCase}) : super(GetTypesInitial()) {
    on<BaseGetTypesEvent>((event, emit) async {
      emit(const GetTypesLoadingState());
      final result = await getTypesUseCase.getTypes();
      result.fold(
              (l) {
                emit(GetTypesSuccessMessageState(internModel: l));
              },
              (r) => emit(GetTypesErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }

}
