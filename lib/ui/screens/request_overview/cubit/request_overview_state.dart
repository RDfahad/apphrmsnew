import 'package:hr_emp_proj/domain/entities/request_entity/request_detail_entity.dart';
import 'package:hr_emp_proj/domain/entities/request_entity/request_entity.dart';

class RequestOverviewState {
  final List<bool> isCheckheight;
  final bool isLoading;
  final RequestModel requestModel;
  final RequestDetailModel requestDetailModel;

  RequestOverviewState(
      {required this.isCheckheight,
      required this.isLoading,
      required this.requestModel,
      required this.requestDetailModel});

  factory RequestOverviewState.init() => RequestOverviewState(
      isCheckheight: [false, false, false],
      isLoading: false,
      requestModel: RequestModel(),
      requestDetailModel: RequestDetailModel());

  RequestOverviewState copyWit(
      {List<bool>? isCheckheight,
      bool? isLoading,
      RequestModel? requestModel,
      RequestDetailModel? requestDetailModel}) {
    return RequestOverviewState(
      isCheckheight: isCheckheight ?? this.isCheckheight,
      isLoading: isLoading ?? this.isLoading,
      requestModel: requestModel ?? this.requestModel,
      requestDetailModel: requestDetailModel ?? this.requestDetailModel,
    );
  }
}
