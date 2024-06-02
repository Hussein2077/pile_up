
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/base_use_case/base_use_case.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/auth/domain/use_case/apple_sign.dart';
import 'package:pile_up/features/auth/domain/use_case/google_sign.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_event.dart';
import 'package:pile_up/features/auth/presentation/controller/sign_in_with_platform_bloc/sign_in_with_platform_state.dart';


class SignInWithPlatformBloc extends Bloc<BaseSignInWithPlatformEvent, SignInWithPlatformState> {
  final SignInWithGoogleUC signInWithGoogleUC;
  final SignInWithAppleUC signInWithAppleUC;


  SignInWithPlatformBloc({
    required this.signInWithGoogleUC,
    required this.signInWithAppleUC,

  }) : super(SignInWithPlatformInitial()) {

    on<SignGoogleEvent>((event, emit) async {
      emit(const SignWithPlatFormLoadingState());
      final result = await signInWithGoogleUC.call(const NoParameter());
      result.fold(
              (l) => emit(SignWithGoogleSuccesMessageState(userData: l,
                  userId: l.apiUserData.id.toString(),
                 )),
              (r) => emit(SignWithGoogleErrorMessageState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });

    on<SignAppleEvent>((event, emit) async {
      emit(const SignWithPlatFormLoadingState());
      final result = await signInWithAppleUC.call(const NoParameter());
      result.fold(
              (l) => emit(SignWithAppleSuccesMessageState(userData: l,
              userId: l.apiUserData.id.toString(),
           )),
              (r) => emit(SignWithAppleErrorMessageState(errorMessage: DioHelper().getTypeOfFailure(r))));
    });



  }
}
