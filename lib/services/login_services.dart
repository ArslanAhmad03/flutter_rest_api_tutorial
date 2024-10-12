import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserLoginServices {
  static loginFun(TextEditingController loginEmailController,
      TextEditingController loginPassController) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var body = {
        "email": loginEmailController.text.trim(),
        "password": loginPassController.text.trim(),
      };

      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/login'),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body.toString());
        print(json['token']);

        if (json['token'] != '') {
          Get.offAll(() => HomeScreen());
        } else {
          print("invalid data");
        }
      }
    } catch (e) {
      print("error $e");
    }
  }
}
