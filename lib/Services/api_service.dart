import 'dart:convert';

import 'package:scmes_lite/Models/users.dart';

List<Users> toListandMap(String responseBody) {
  Map data = json.decode(responseBody);
  var videos = data['getUser']; //returns a List of Maps
  final casting = videos.cast<Map<String, dynamic>>();
  return casting.map<Users>((json) => Users.fromJson(json)).toList();
}
