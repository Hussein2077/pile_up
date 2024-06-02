import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/my_wallet/data/models/my_wallet_model.dart';
import 'package:pile_up/features/my_wallet/domain/use_case/get_blogs_use_case.dart';

part 'my_wallet_event.dart';
part 'my_wallet_state.dart';

class GetMyWalletBloc extends Bloc<BaseGetMyWalletEvent, GetMyWalletState> {
  GetMyWalletUseCase getMyWalletUseCase;

  GetMyWalletBloc({required this.getMyWalletUseCase}) : super(GetMyWalletInitial()) {
    on<BaseGetMyWalletEvent>((event, emit) async {
      emit(const GetMyWalletLoadingState());
      final result = await getMyWalletUseCase.getMyWallet();
      result.fold(
              (l) => emit(GetMyWalletSuccessMessageState(internModel: l)),
              (r) => emit(GetMyWalletErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
