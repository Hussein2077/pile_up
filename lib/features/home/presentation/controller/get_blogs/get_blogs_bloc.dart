import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/domain/use_case/get_blogs_use_case.dart';
import 'package:pile_up/features/home/presentation/controller/get_blogs/get_blogs_event.dart';
import 'package:pile_up/features/home/presentation/controller/get_blogs/get_blogs_state.dart';



class GetBlogsBloc extends Bloc<BaseGetBlogsEvent, GetBlogsState> {
  GetBlogsUseCase getBlogsUseCase;
  
  GetBlogsBloc({required this.getBlogsUseCase}) : super(GetBlogsInitial()) {
    on<BaseGetBlogsEvent>((event, emit) async {
      emit(const GetBlogsLoadingState());
      final result = await getBlogsUseCase.getBlogs();
      result.fold(
              (l) => emit(GetBlogsSuccessMessageState(internModel: l)),
              (r) => emit(GetBlogsErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
