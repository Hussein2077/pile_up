import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/domain/use_case/verify_code.dart';
import 'package:pile_up/features/auth/presentation/controller/change_password_bloc/change_password_events.dart';
import 'package:pile_up/features/auth/presentation/controller/change_password_bloc/change_password_states.dart';

class ResetPasswordFlowBloc
    extends Bloc<BaseChangePasswordEvent, ResetPasswordState> {
  VerifyCodeUseCase verifyCodeUseCase;

  ResetPasswordFlowBloc(
      {
      required this.verifyCodeUseCase})
      : super(ResetPasswordInitial()) {

    on<VerifyCodeEvent>((event, emit) async {
      emit(const VerifyCodeLoadingState());
      final result = await verifyCodeUseCase
          .call(AuthModel(code: event.code,));
      result.fold(
          (l) =>
              emit(VerifyCodeSuccessMessageState(successMessage: l['message'])),
          (r) => emit(VerifyCodeErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
