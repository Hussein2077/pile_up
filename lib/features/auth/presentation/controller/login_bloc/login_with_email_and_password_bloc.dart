import 'package:easy_localization/easy_localization.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/resource_manager/string_manager.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/auth/domain/use_case/login_with_email_and_password_use_case.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_events.dart';
import 'package:pile_up/features/auth/presentation/controller/login_bloc/login_with_email_and_password_states.dart';

class LoginWithEmailAndPasswordBloc extends Bloc<
    BaseLoginWithEmailAndPasswordEvent, LoginWithEmailAndPasswordState> {
  LoginWithEmailAndPasswordUseCase loginWithEmailAndPasswordUseCase;
  LoginWithEmailAndPasswordBloc(
      {required this.loginWithEmailAndPasswordUseCase})
      : super(LoginWithEmailAndPasswordInitial()) {
    on<LoginWithEmailAndPasswordEvent>((event, emit) async {
      emit(
        const LoginWithEmailAndPasswordLoadingState(),
      );
      final result = await loginWithEmailAndPasswordUseCase
          .call(AuthModel(phone: event.phone,));
      result.fold(
        (l) => emit(
          LoginWithEmailAndPasswordSuccessMessageState(
            successMessage: StringManager.loginSuccessfully.tr(),
          ),
        ),
        (r) => emit(
          LoginWithEmailAndPasswordErrorMessageState(
            errorMessage: DioHelper().getTypeOfFailure(r),
          ),
        ),
      );
    });
  }
}
