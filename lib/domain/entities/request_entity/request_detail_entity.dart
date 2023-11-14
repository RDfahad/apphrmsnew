class RequestDetailModel {
  bool? success;
  String? responseMessage;
  String? responseCode;
  ResponseData? responseData;

  RequestDetailModel(
      {this.success,
      this.responseMessage,
      this.responseCode,
      this.responseData});

  RequestDetailModel.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    responseData = json['responseData'] != null
        ? ResponseData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
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
  ReqestDetails? reqestDetails;

  ResponseData({this.reqestDetails});

  ResponseData.fromJson(Map<String, dynamic> json) {
    reqestDetails = json['reqest_details'] != null
        ? ReqestDetails.fromJson(json['reqest_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    if (reqestDetails != null) {
      data['reqest_details'] = reqestDetails!.toJson();
    }
    return data;
  }
}

class ReqestDetails {
  int? id;
  String? requestSubject;
  String? applyDate;
  String? category;
  String? fromDate;
  String? tillDate;
  String? description;
  String? requestStatus;
  RequestDocument? requestDocument;

  ReqestDetails(
      {this.id,
      this.requestSubject,
      this.applyDate,
      this.category,
      this.fromDate,
      this.tillDate,
      this.description,
      this.requestStatus,
      this.requestDocument});

  ReqestDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    requestSubject = json['request_subject'];
    applyDate = json['apply_date'];
    category = json['category'];
    fromDate = json['from_date'];
    tillDate = json['till_date'];
    description = json['description'];
    requestStatus = json['request_status'];
    requestDocument = json['request_document'] != null
        ? RequestDocument.fromJson(json['request_document'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['request_subject'] = requestSubject;
    data['apply_date'] = applyDate;
    data['category'] = category;
    data['from_date'] = fromDate;
    data['till_date'] = tillDate;
    data['description'] = description;
    data['request_status'] = requestStatus;
    if (requestDocument != null) {
      data['request_document'] = requestDocument!.toJson();
    }
    return data;
  }
}

class RequestDocument {
  String? extension;
  String? file;
  String? documentCategoryName;
  String? documentCategorySlug;
  String? fileName;
  String? documentInformation;

  RequestDocument(
      {this.extension,
      this.file,
      this.documentCategoryName,
      this.documentCategorySlug,
      this.fileName,
      this.documentInformation});

  RequestDocument.fromJson(Map<String, dynamic> json) {
    extension = json['extension'];
    file = json['file'];
    documentCategoryName = json['document_category_name'];
    documentCategorySlug = json['document_category_slug'];
    fileName = json['file_name'];
    documentInformation = json['document_information'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['extension'] = extension;
    data['file'] = file;
    data['document_category_name'] = documentCategoryName;
    data['document_category_slug'] = documentCategorySlug;
    data['file_name'] = fileName;
    data['document_information'] = documentInformation;
    return data;
  }
}
