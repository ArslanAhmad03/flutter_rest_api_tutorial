import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/controller/signup_controller.dart';
import 'package:provider/provider.dart';

class SignUpView extends StatefulWidget {
  const SignUpView({super.key});

  @override
  State<SignUpView> createState() => _SignUpViewState();
}

class _SignUpViewState extends State<SignUpView> {
  @override
  Widget build(BuildContext context) {
    final signUpProvider = Provider.of<SignUpController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Sign Up'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child:
        Consumer<SignUpController>(builder: (context, signUpValues, child) {
          return Form(
            key: signUpValues.signUpFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: signUpValues.signUpEmailController,
                    decoration: InputDecoration(
                        label: Text('email'), hintText: 'email')),
                SizedBox(height: 10),
                TextFormField(
                    controller: signUpValues.signUpPassController,
                    decoration: InputDecoration(
                        label: Text('password'), hintText: 'password')),
                ElevatedButton(
                    onPressed: () {
                      if (signUpValues.signUpFormKey.currentState!.validate()) {
                        signUpValues.userSignUp(
                          signUpValues.signUpEmailController,
                          signUpValues.signUpPassController,
                        );
                      }
                    },
                    child: Text('Sign Up'))
              ],
            ),
          );
        }),
      ),
    );
  }
}
