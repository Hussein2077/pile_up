import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/data/model/home_carousel_model.dart';
import 'package:pile_up/features/home/domain/use_case/get_home_carousel_use_case.dart';

part 'get_home_carousel_event.dart';
part 'get_home_carousel_state.dart';

class GetHomeCarouselBloc extends Bloc<BaseGetHomeCarouselEvent, GetHomeCarouselState> {
  GetHomeCarouselUseCase getHomeCarouselUseCase;
  
  GetHomeCarouselBloc({required this.getHomeCarouselUseCase}) : super(GetHomeCarouselInitial()) {
    on<BaseGetHomeCarouselEvent>((event, emit) async {
      emit(const GetHomeCarouselLoadingState());
      final result = await getHomeCarouselUseCase.getHomeCarousel();
      result.fold(
              (l) => emit(GetHomeCarouselSuccessMessageState(internModel: l)),
              (r) => emit(GetHomeCarouselErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
