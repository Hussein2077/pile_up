import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/home/data/model/notifications_model.dart';
import 'package:pile_up/features/home/domain/use_case/get_notifications_use_case.dart';

part 'get_notifications_event.dart';
part 'get_notifications_state.dart';

class GetNotificationsBloc extends Bloc<BaseGetNotificationsEvent, GetNotificationsState> {
  GetNotificationsUseCase getNotificationsUseCase;
  
  GetNotificationsBloc({required this.getNotificationsUseCase}) : super(GetNotificationsInitial()) {
    on<BaseGetNotificationsEvent>((event, emit) async {
      emit(const GetNotificationsLoadingState());
      final result = await getNotificationsUseCase.getNotifications();
      result.fold(
              (l) => emit(GetNotificationsSuccessMessageState(internModel: l)),
              (r) => emit(GetNotificationsErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
}
