class AttendanceRecords {
  AttendanceRecords({
    this.success,
    this.responseMessage,
    this.responseCode,
    this.responseData,
  });

  AttendanceRecords.fromJson(dynamic json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? ResponseData.fromJson(json['responseData'])
        : null;
  }
  bool? success;
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;
  AttendanceRecords copyWith({
    bool? success,
    String? responseMessage,
    String? responseCode,
    ResponseData? responseData,
  }) =>
      AttendanceRecords(
        success: success ?? this.success,
        responseMessage: responseMessage ?? this.responseMessage,
        responseCode: responseCode ?? this.responseCode,
        responseData: responseData ?? this.responseData,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['success'] = success;
    map['responseMessage'] = responseMessage;
    map['responseCode'] = responseCode;
    if (responseData != null) {
      map['responseData'] = responseData?.toJson();
    }
    return map;
  }
}

class ResponseData {
  ResponseData({
    this.attendenceObject,
  });

  ResponseData.fromJson(dynamic json) {
    attendenceObject = json['attendenceObject'] != null
        ? AttendenceObject.fromJson(json['attendenceObject'])
        : null;
  }
  AttendenceObject? attendenceObject;
  ResponseData copyWith({
    AttendenceObject? attendenceObject,
  }) =>
      ResponseData(
        attendenceObject: attendenceObject ?? this.attendenceObject,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (attendenceObject != null) {
      map['attendenceObject'] = attendenceObject?.toJson();
    }
    return map;
  }
}

class AttendenceObject {
  AttendenceObject({
    this.currentPage,
    this.data,
    this.firstPageUrl,
    this.from,
    this.lastPage,
    this.lastPageUrl,
    this.nextPageUrl,
    this.path,
    this.perPage,
    this.prevPageUrl,
    this.to,
    this.total,
  });

  AttendenceObject.fromJson(dynamic json) {
    currentPage = json['current_page'];
    if (json['data'] != null) {
      data = [];
      json['data'].forEach((v) {
        data?.add(AttendenceData.fromJson(v));
      });
    }
    firstPageUrl = json['first_page_url'];
    from = json['from'];
    lastPage = json['last_page'];
    lastPageUrl = json['last_page_url'];
    nextPageUrl = json['next_page_url'];
    path = json['path'];
    perPage = json['per_page'];
    prevPageUrl = json['prev_page_url'];
    to = json['to'];
    total = json['total'];
  }
  int? currentPage;
  List<AttendenceData>? data;
  String? firstPageUrl;
  int? from;
  int? lastPage;
  String? lastPageUrl;
  String? nextPageUrl;
  String? path;
  int? perPage;
  dynamic prevPageUrl;
  int? to;
  int? total;
  AttendenceObject copyWith({
    int? currentPage,
    List<AttendenceData>? data,
    String? firstPageUrl,
    int? from,
    int? lastPage,
    String? lastPageUrl,
    String? nextPageUrl,
    String? path,
    int? perPage,
    dynamic prevPageUrl,
    int? to,
    int? total,
  }) =>
      AttendenceObject(
        currentPage: currentPage ?? this.currentPage,
        data: data ?? this.data,
        firstPageUrl: firstPageUrl ?? this.firstPageUrl,
        from: from ?? this.from,
        lastPage: lastPage ?? this.lastPage,
        lastPageUrl: lastPageUrl ?? this.lastPageUrl,
        nextPageUrl: nextPageUrl ?? this.nextPageUrl,
        path: path ?? this.path,
        perPage: perPage ?? this.perPage,
        prevPageUrl: prevPageUrl ?? this.prevPageUrl,
        to: to ?? this.to,
        total: total ?? this.total,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['current_page'] = currentPage;
    if (data != null) {
      map['data'] = data?.map((v) => v.toJson()).toList();
    }
    map['first_page_url'] = firstPageUrl;
    map['from'] = from;
    map['last_page'] = lastPage;
    map['last_page_url'] = lastPageUrl;
    map['next_page_url'] = nextPageUrl;
    map['path'] = path;
    map['per_page'] = perPage;
    map['prev_page_url'] = prevPageUrl;
    map['to'] = to;
    map['total'] = total;
    return map;
  }
}

class AttendenceData {
  AttendenceData({
    this.date,
    this.checkInTime,
    this.checkOutTime,
  });

  AttendenceData.fromJson(dynamic json) {
    date = json['date'];
    checkInTime = json['check_in_time'];
    checkOutTime = json['check_out_time'];
  }
  String? date;
  String? checkInTime;
  String? checkOutTime;
  AttendenceData copyWith({
    String? date,
    String? checkInTime,
    String? checkOutTime,
  }) =>
      AttendenceData(
        date: date ?? this.date,
        checkInTime: checkInTime ?? this.checkInTime,
        checkOutTime: checkOutTime ?? this.checkOutTime,
      );
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['check_in_time'] = checkInTime;
    map['check_out_time'] = checkOutTime;
    return map;
  }
}
