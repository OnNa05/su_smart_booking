import 'dart:convert';
import 'dart:developer';
import 'package:http/http.dart' as http;

class Room {
  late String id;
  late String name;
  late List<String> role;
  late List<String> roomEquipment;
  late String usage;

  Room.newRooms();
  Room(
      {required this.id,
      required this.name,
      required this.role,
      required this.roomEquipment,
      required this.usage});

  factory Room.fromJson(Map<String, dynamic> json) {
    log(json['room_equipment']);
    return Room(
        id: json['id'],
        name: json['name'],
        role: json['role'],
        roomEquipment: json['room_equipment'],
        usage: json['usage']);
  }

  Future<List<Room>?> getAllRoom(String endpoint) async {
    // Make the HTTP GET request
    // final response = await http.get(Uri.parse('$endpoint/all-rooms'));
    var uri = Uri.parse('http://$endpoint/all-rooms');
    log('http://$endpoint/all-rooms');
    var request = http.MultipartRequest('GET', uri);
    var response = await request.send();

    // Check the status code of the response
    if (response.statusCode == 200) {
      // Decode the response body from JSON to a List of Maps
      log("body: ${response.stream.toBytes()}");
      var responseData = await response.stream.toBytes();
      String result = String.fromCharCodes(responseData);
      log("result: ${result}");

      // Convert each Map to a Data instance
      var re = Room.fromJson(jsonDecode(result));
      log("dataObjects: ${re}");
    } else {
      print('Request failed with status code: ${response.statusCode}');
    }
    return null;
  }
}
