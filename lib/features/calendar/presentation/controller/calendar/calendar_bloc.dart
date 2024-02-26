import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:pile_up/core/utils/api_helper.dart';
import 'package:pile_up/features/calendar/domain/use_case/calendar_use_case.dart';
import 'package:pile_up/features/calendar/presentation/controller/calendar/calendar_event.dart';
import 'package:pile_up/features/calendar/presentation/controller/calendar/calendar_state.dart';

class GetCalendarBloc extends Bloc<BaseGetCalendarEvent, GetCalendarState> {
  GetCalendarUseCase getCalendarUseCase;
  // List<UserFolder>? userFolder;
  GetCalendarBloc({required this.getCalendarUseCase}) : super(GetCalendarInitial()) {
    on<BaseGetCalendarEvent>((event, emit) async {
      emit(const GetCalendarLoadingState());
      final result = await getCalendarUseCase.getCalendars();
      result.fold(
              (l) {
                emit(GetCalendarSuccessMessageState(internModel: l));
                // userFolder=l;
              },
              (r) => emit(GetCalendarErrorMessageState(
              errorMessage: DioHelper().getTypeOfFailure(r))));
    });
  }
  // String?fileName;
  // toggle(int index){
  //   fileName=userFolder?[index].folderName;
  //       // for(int i =0;i<userFolder!.length;i++){
  //       //
  //       // }
  // }
}
