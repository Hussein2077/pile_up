import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/profile/data/model/my_profile_model.dart';
import 'package:pile_up/features/profile/domain/use_case/edit_my_profile_use_case.dart';
import 'package:pile_up/features/profile/domain/use_case/get_my_profile_use_case.dart';

part 'my_profile_event.dart';

part 'my_profile_state.dart';

class GetMyProfileBloc extends Bloc<BaseGetMyProfileEvent, GetMyProfileState> {
  GetMyProfileUseCase getMyProfileUseCase;
  EditMyProfileUseCase editMyProfileUseCase;

  GetMyProfileBloc(
      {required this.getMyProfileUseCase, required this.editMyProfileUseCase})
      : super(GetMyProfileInitial()) {
    on<GetMyProfileEvent>((event, emit) async {
      emit(const GetMyProfileLoadingState());
      final result = await getMyProfileUseCase.getMyProfile();
      result.fold(
          (l) => emit(GetMyProfileSuccessMessageState(internModel: l)),
          (r) => emit(GetMyProfileErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
    on<EditMyProfileEvent>((event, emit) async {
      emit(const EditMyProfileLoadingState());
      final result = await editMyProfileUseCase.editMyProfile(EditProfileParams(
        firstName: event.firstName,
        lastName: event.lastName,
        email: event.email,
        reminder: event.reminder,
      ));
      result.fold(
          (l) => emit(EditMyProfileSuccessMessageState(internModel: l)),
          (r) => emit(EditMyProfileErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
