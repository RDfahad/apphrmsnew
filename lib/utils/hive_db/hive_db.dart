import 'package:hive/hive.dart';

class HiveStorage {
  final mybox = Hive.box('UserData');

  putData(String key, dynamic value) async {
    mybox.put(key, value);
  }

  putEncryptedData() {}

  getData(String key) {
    var data = mybox.get(key);
    return data;
  }

  getEncryptedData() {}
  updateData(String key, dynamic value) async {
    await mybox.put(key, value);
  }
}
