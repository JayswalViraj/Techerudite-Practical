import 'dart:convert';
import 'dart:ffi';

import 'package:flutter/cupertino.dart';
import 'package:practicaltecherudite/models/home_list_model.dart';
import 'package:practicaltecherudite/models/logig_model.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  static LoginApiModel? loginApiModel;

  static HomeList? homeListApiModel;

  static Future<bool> callLoginApi({String? email, password}) async {
    var requestBody = {
      'email': email,
      'password': password,
    };

    var client = http.Client();
    var uri = Uri.parse(
        "https://techeruditedev.xyz/projects/plie-api/public/api/login");

    var response = await client.post(uri, body: requestBody);
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print("Json" + json.toString());
      print("Success" + json["success"].toString());

      if (json["success"] == true) {
        print("Success");

        loginApiModel = loginApiModelFromJson(response.body);
        print(loginApiModel!.message.toString());
        return true;
      } else {
        print("not success");
        return false;
      }
    } else {
      debugPrint("Api Code not +==200");

      return false;
    }
  }

  static Future<HomeList> callHomeListApi({String? email, password}) async {
    var client = http.Client();
    var uri = Uri.parse(
        "https://techeruditedev.xyz/projects/plie-api/public/api/events-listing");

    var response = await client.post(
      uri,
    );
    if (response.statusCode == 200) {
      Map<String, dynamic> json = jsonDecode(response.body);
      print("Json" + json.toString());
      print("Success" + json["success"].toString());

      print("Success");

      return homeListApiModel = homeListFromJson(response.body);
      print(homeListApiModel!.message.toString());
    } else {
      debugPrint("Api Code not +==200");
      return homeListApiModel = homeListFromJson(response.body);
    }
  }
}
