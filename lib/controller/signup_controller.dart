
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/services/sign_up_services.dart';

class SignUpController with ChangeNotifier {
  TextEditingController signUpEmailController = TextEditingController();
  TextEditingController signUpPassController = TextEditingController();

  GlobalKey<FormState> signUpFormKey = GlobalKey();

  Future userSignUp(TextEditingController signUpEmailController,
      TextEditingController signUpPassController) async {
    if(signUpEmailController.text.isEmpty && signUpPassController.text.isEmpty){
      print('please enter detail');
      notifyListeners();
    }else{
      UserSignUpServices.signUpFun(signUpEmailController, signUpPassController);
      notifyListeners();
    }
  }
}
