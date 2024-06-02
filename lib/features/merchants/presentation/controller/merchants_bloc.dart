import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/merchants/data/model/merchant_model.dart';
import 'package:pile_up/features/merchants/domain/use_case/get_merchants_use_case.dart';

part 'merchants_event.dart';
part 'merchants_state.dart';

class GetMerchantsBloc extends Bloc<BaseGetMerchantsEvent, GetMerchantsState> {
  GetMerchantsUseCase getMerchantsUseCase;

  GetMerchantsBloc({required this.getMerchantsUseCase}) : super(GetMerchantsInitial()) {
    on<BaseGetMerchantsEvent>((event, emit) async {
      emit(const GetMerchantsLoadingState());
      final result = await getMerchantsUseCase.getMerchants();
      result.fold(
              (l) => emit(GetMerchantsSuccessMessageState(internModel: l)),
              (r) => emit(GetMerchantsErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
