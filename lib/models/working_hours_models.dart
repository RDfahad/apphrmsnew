class WorkingHoursModel {
  bool? success;
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;

  WorkingHoursModel(
      {this.success,
      this.responseMessage,
      this.responseCode,
      this.responseData});

  WorkingHoursModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson(data) {
    
    final Map<String, dynamic> data = <String, dynamic>{};
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
  WeekWiseWorkedHours? weekWiseWorkedHours;

  ResponseData({this.weekWiseWorkedHours});

  ResponseData.fromJson(Map<dynamic, dynamic> json) {
    weekWiseWorkedHours = json['weekWiseWorkedHours'] != null
        ? WeekWiseWorkedHours.fromJson(json['weekWiseWorkedHours'])
        : null;
  }

  Map<dynamic, dynamic> toJson() {
    final Map<dynamic, dynamic> data = <dynamic, dynamic>{};
    if (weekWiseWorkedHours != null) {
      data['weekWiseWorkedHours'] = weekWiseWorkedHours!.toJson();
    }
    return data;
  }
}

class WeekWiseWorkedHours {
  String? mON;
  String? tUE;
  String? wED;
  String? tHU;
  String? fRI;
  String? sAT;
  String? sUN;

  WeekWiseWorkedHours(
      {this.mON, this.tUE, this.wED, this.tHU, this.fRI, this.sAT, this.sUN});

  WeekWiseWorkedHours.fromJson(Map<String, dynamic> json) {
    mON = json['MON'];
    tUE = json['TUE'];
    wED = json['WED'];
    tHU = json['THU'];
    fRI = json['FRI'];
    sAT = json['SAT'];
    sUN = json['SUN'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['MON'] = mON;
    data['TUE'] = tUE;
    data['WED'] = wED;
    data['THU'] = tHU;
    data['FRI'] = fRI;
    data['SAT'] = sAT;
    data['SUN'] = sUN;
    return data;
  }
}
