
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/services/login_services.dart';

class LoginController with ChangeNotifier {
  TextEditingController loginEmailController = TextEditingController();
  TextEditingController loginPassController = TextEditingController();

  GlobalKey<FormState> loginFormKey = GlobalKey();

  Future userLogin(TextEditingController loginEmailController,
      TextEditingController loginPassController) async {
    if(loginEmailController.text.isEmpty && loginPassController.text.isEmpty){
      print('please enter detail');
      notifyListeners();
    }else{
      UserLoginServices.loginFun(loginEmailController, loginPassController);
      notifyListeners();
    }
  }
}
