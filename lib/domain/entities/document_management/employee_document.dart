class EmployeeDocument {
  bool? success;
  String? responseMessage;
  String? responseCode;
  DocumentData? documentData;

  EmployeeDocument(
      {this.success,
        this.responseMessage,
        this.responseCode,
        this.documentData});

  EmployeeDocument.fromJson(Map<String, dynamic> json) {
    success = json['success'];
    responseMessage = json['responseMessage'];
    responseCode = json['responseCode'];
    documentData = json['responseData'] != null
        ? new DocumentData.fromJson(json['responseData'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['success'] = this.success;
    data['responseMessage'] = this.responseMessage;
    data['responseCode'] = this.responseCode;
    if (this.documentData != null) {
      data['responseData'] = this.documentData!.toJson();
    }
    return data;
  }
}

class DocumentData {
  List<Documents>? documents;

  DocumentData({this.documents});

  DocumentData.fromJson(Map<String, dynamic> json) {
    if (json['documents'] != null) {
      documents = <Documents>[];
      json['documents'].forEach((v) {
        documents!.add(new Documents.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.documents != null) {
      data['documents'] = this.documents!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Documents {
  String? title;
  String? category;
  String? type;
  String? url;

  Documents({this.title, this.category, this.type, this.url});

  Documents.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    category = json['category'];
    type = json['type'];
    url = json['url'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    data['category'] = this.category;
    data['type'] = this.type;
    data['url'] = this.url;
    return data;
  }
}
