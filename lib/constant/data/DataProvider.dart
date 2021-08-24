import 'dart:convert';

import 'package:ExercicesL2IG/constant/models/client.dart';
import 'package:ExercicesL2IG/constant/models/result.dart';
import 'package:http/http.dart' as http;

import 'package:flutter/material.dart';

class DataApiProvider {
  final myBaseUrl =
      "http://192.168.43.244:82/ExercicesL2IG/ExercicesL2IG/test@Flutter";
  final http.Client httpClient = http.Client();

  Future<Result> saveClient({@required Client client}) async {
    try {
      print("${jsonEncode(client.toJson())}");
      String url = Uri.encodeFull('$myBaseUrl/insert.php');
      final response = await httpClient.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode(client.toJson()),
      );
      print(response.body);
      // if (response.statusCode != 200) {
      //   throw Exception('une erreur est servenue, reessayer!');
      // }
      final json = (jsonDecode(response.body));
      return Result.fromJson(json);
    } catch (e) {
      Result res = new Result(status: false);
      print('Error occured : $e');
      return res;
    }
  }

  // Future<List<dynamic>> loginClient(
  Future<Result> loginClient(
      {@required String username, String password}) async {
    try {
      List<dynamic> list = List();
      // print("${jsonEncode(client.toJson())}");
      String url = Uri.encodeFull('$myBaseUrl/select.php');
      final response = await httpClient.post(
        url,
        headers: {"content-type": "application/json"},
        body: jsonEncode({"username": username, "password": password}),
      );
      var resultat = await jsonDecode(response.body);
      print(resultat['message']);
      var result = Result.fromJson(resultat);
      // for (int i = 0; i < resultat['message'].length; i++) {
      //   list.add(resultat[i]);
      // }
      return result;
    } catch (e) {
      print('Error occured : $e');
    }
    return null;
  }
}
