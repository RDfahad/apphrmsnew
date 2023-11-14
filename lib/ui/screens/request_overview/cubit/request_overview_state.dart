import 'package:hr_emp_proj/domain/entities/request_entity/request_entity.dart';

class RequestOverviewState {
  final List<bool> isCheckheight;
  final bool isLoading;
  final RequestModel requestModel;

  RequestOverviewState({required this.isCheckheight, required this.isLoading, required this.requestModel});

  factory RequestOverviewState.init() => RequestOverviewState(
      isCheckheight: [false, false, false], isLoading: false, requestModel: RequestModel());

  RequestOverviewState copyWit({List<bool>? isCheckheight, bool? isLoading, RequestModel? requestModel}) {
    return RequestOverviewState(
        isCheckheight: isCheckheight ?? this.isCheckheight,
        isLoading: isLoading ?? this.isLoading,
        requestModel: requestModel ?? this.requestModel);
  }
}
