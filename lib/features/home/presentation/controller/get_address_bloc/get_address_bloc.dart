import 'package:bloc/bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/domain/use_case/get_address_book_uc.dart';
import 'package:pile_up/features/home/presentation/controller/get_address_bloc/get_address_event.dart';
import 'package:pile_up/features/home/presentation/controller/get_address_bloc/get_address_state.dart';



class GetAddressBookBloc extends Bloc<BaseGetAddressBookEvent, GetAddressBookState> {
  GetAddressBookUseCase getAddressBookUseCase;
  
  GetAddressBookBloc({required this.getAddressBookUseCase}) : super(GetAddressBookInitial()) {
    on<BaseGetAddressBookEvent>((event, emit) async {
      emit(const GetAddressBookLoadingState());
      final result = await getAddressBookUseCase.getAddressBook();
      result.fold(
              (l) => emit(GetAddressBookSuccessMessageState(getAddressBook: l)),
              (r) => emit(GetAddressBookErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
