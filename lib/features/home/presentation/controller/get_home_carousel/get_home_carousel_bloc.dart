import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/domain/use_case/get_home_carousel_use_case.dart';
import 'package:pile_up/features/home/presentation/controller/get_home_carousel/get_home_carousel_event.dart';
import 'package:pile_up/features/home/presentation/controller/get_home_carousel/get_home_carousel_state.dart';


class GetHomeCarouselBloc extends Bloc<BaseGetHomeCarouselEvent, GetHomeCarouselState> {
  GetHomeCarouselUseCase getHomeCarouselUseCase;
  
  GetHomeCarouselBloc({required this.getHomeCarouselUseCase}) : super(GetHomeCarouselInitial()) {
    on<GetHomeCarouseEvent>((event, emit) async {
      emit(const GetHomeCarouselLoadingState());
      final result = await getHomeCarouselUseCase.getHomeCarousel();
      result.fold(
              (l) => emit(GetHomeCarouselSuccessMessageState(internModel: l)),
              (r) => emit(GetHomeCarouselErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
