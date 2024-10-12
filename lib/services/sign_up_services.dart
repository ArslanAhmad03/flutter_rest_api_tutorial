import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/home_screen.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserSignUpServices {
  static signUpFun(TextEditingController signUpEmailController,
      TextEditingController signUpPassController) async {
    try {
      var headers = {"Content-Type": "application/json"};
      var body = {
        "email": signUpEmailController.text.trim(),
        "password": signUpPassController.text.trim(),
      };

      http.Response response = await http.post(
        Uri.parse('https://reqres.in/api/register'),
        headers: headers,
        body: jsonEncode(body),
      );
      if (response.statusCode == 200) {
        Map json = jsonDecode(response.body.toString());
        print(json['token']);

        if (json['token'] != '') {
          signUpEmailController.clear();
          signUpPassController.clear();
          Get.offAll(() => const HomeScreen());
        } else {
          print("invalid data");
        }
      }
    } catch (e) {
      print("error $e");
    }
  }
}
