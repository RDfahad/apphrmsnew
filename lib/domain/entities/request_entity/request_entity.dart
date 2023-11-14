class RequestModel {
  bool? success;
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;

  RequestModel(
      {this.success,
      this.responseMessage,
      this.responseCode,
      this.responseData});

  RequestModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    data['success'] = success;
    data['responseMessage'] = responseMessage;
    data['responseCode'] = responseCode;
    if (responseData != null) {
      data['responseData'] = responseData!.toJson();
    }
    return data;
  }
}

class ResponseData {
  List<Reqests>? reqests;

  ResponseData({this.reqests});

  ResponseData.fromJson(Map<String, dynamic> json) {
    if (json['reqests'] != null) {
      reqests = <Reqests>[];
      json['reqests'].forEach((v) {
        reqests!.add(Reqests.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = Map<String, dynamic>();
    if (reqests != null) {
      data['reqests'] = reqests!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Reqests {
  int? id;
  String? requestSubject;
  String? applyDate;
  String? category;
  String? fromDate;
  String? tillDate;
  String? description;
  String? requestStatus;

  Reqests(
      {this.id,
      this.requestSubject,
      this.applyDate,
      this.category,
      this.fromDate,
      this.tillDate,
      this.description,
      this.requestStatus});

  Reqests.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestSubject = json['request_subject'];
    applyDate = json['apply_date'];
    category = json['category'];
    fromDate = json['from_date'];
    tillDate = json['till_date'];
    description = json['description'];
    requestStatus = json['request_status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data =  Map<String, dynamic>();
    data['id'] = id;
    data['request_subject'] = requestSubject;
    data['apply_date'] = applyDate;
    data['category'] = category;
    data['from_date'] = fromDate;
    data['till_date'] = tillDate;
    data['description'] = description;
    data['request_status'] = requestStatus;
    return data;
  }
}
