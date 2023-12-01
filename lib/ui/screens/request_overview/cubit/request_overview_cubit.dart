import 'dart:developer';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hr_emp_proj/domain/repository/request_repo/request_repo.dart';
import 'package:hr_emp_proj/ui/screens/request_overview/cubit/request_overview_state.dart';


class RequestOverviewCubit extends Cubit<RequestOverviewState> {
  RequestRepo requestRepo;
  RequestOverviewCubit(this.requestRepo) : super(RequestOverviewState.init()) {
    getRequestOverview();
  }

  updateIsCheckValue(int index) {
    List<bool> updatedList = List.from(state.isCheckheight);
    updatedList[index] = !updatedList[index];
    emit(state.copyWit(isCheckheight: updatedList));
  }

  void getRequestOverview() async {
    emit(state.copyWit(isLoading: true));
    await requestRepo.getRequest().then((value) async {
      log("getRequestOverview: ${value.toJson()}");
      emit(state.copyWit(requestModel: value, isLoading: false));
      // getRequestDetailOverview(value.responseData?.reqests?[0].id ?? 0);
    }, onError: (error) {
      log("Error getting request $error");
      emit(state.copyWit(isLoading: false));
    });
  }

  getRequestDetailOverview(id) async {
    emit(state.copyWit(isLoading: true));
    await requestRepo.getRequestDetail(id).then((value) async {
      log("getRequestDetailOverview: ${value.toJson()}");
      emit(state.copyWit(requestDetailModel: value, isLoading: false));
    }, onError: (error) {
      log("Error getting Detail request $error");
      emit(state.copyWit(isLoading: false));
    });
  }

  
}
