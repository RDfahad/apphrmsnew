import 'dart:convert';

import 'package:hive/hive.dart';

class HiveStorage {
  final mybox = Hive.box('UserData');

  putData(String key, dynamic value) async {
    mybox.put(key, value);
  }


  getData(String key) {
    var data = mybox.get(key);
    return data;
  }

  putModelData(String key, dynamic value) async {
    mybox.put(key, jsonEncode(value));
  }

  getModelData(String key) {
    var data = mybox.get(key);
    return jsonDecode(data);
  }

  updateData(String key, dynamic value) async {
    await mybox.put(key, value);
  }
}
