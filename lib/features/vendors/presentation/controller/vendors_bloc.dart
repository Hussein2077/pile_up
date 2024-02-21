import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/vendors/data/model/vendor_model.dart';
import 'package:pile_up/features/vendors/domain/use_case/get_vendors_use_case.dart';

part 'vendors_event.dart';
part 'vendors_state.dart';

class GetVendorsBloc extends Bloc<BaseGetVendorsEvent, GetVendorsState> {
  GetVendorsUseCase getVendorsUseCase;

  GetVendorsBloc({required this.getVendorsUseCase}) : super(GetVendorsInitial()) {
    on<BaseGetVendorsEvent>((event, emit) async {
      emit(const GetVendorsLoadingState());
      final result = await getVendorsUseCase.getVendors();
      result.fold(
              (l) => emit(GetVendorsSuccessMessageState(internModel: l)),
              (r) => emit(GetVendorsErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
