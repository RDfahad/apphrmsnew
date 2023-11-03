
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/ui/screens/request_overview/cubit/request_overview_state.dart';

class RequestOverviewCubit extends Cubit<RequestOverviewState> {
  RequestOverviewCubit() : super(RequestOverviewState.init());

  updateIsCheckValue(int index) {
    List<bool> updatedList = List.from(state.isCheckheight);
    updatedList[index] = !updatedList[index];
    emit(state.copyWit(isCheckheight: updatedList));
  }
}
