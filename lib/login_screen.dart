import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/controller/login_controller.dart';
import 'package:provider/provider.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginController>(context, listen: false);
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text('Login Screen'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.0),
        child:
            Consumer<LoginController>(builder: (context, loginValues, child) {
          return Form(
            key: loginValues.loginFormKey,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                TextFormField(
                    controller: loginValues.loginEmailController,
                    decoration: InputDecoration(
                        label: Text('email'), hintText: 'email')),
                SizedBox(height: 10),
                TextFormField(
                    controller: loginValues.loginPassController,
                    decoration: InputDecoration(
                        label: Text('password'), hintText: 'password')),
                ElevatedButton(
                    onPressed: () {
                      if (loginValues.loginFormKey.currentState!.validate()) {
                        loginValues.userLogin(
                          loginValues.loginEmailController,
                          loginValues.loginPassController,
                        );
                      }
                    },
                    child: Text('Login'))
              ],
            ),
          );
        }),
      ),
    );
  }
}
