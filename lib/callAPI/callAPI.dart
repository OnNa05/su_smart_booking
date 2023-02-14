import 'dart:convert';
import 'dart:io';

class CallAPI {
  CallAPI();

  Future<String> loadJsonFile(String name) async {
    return await File(name).readAsString();
  }

  Future<List<Map<String, dynamic>>> parseJson(String jsonString) async {
    return json.decode(jsonString) as List<Map<String, dynamic>>;
  }
}
