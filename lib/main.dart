import 'package:flutter/material.dart';
import 'package:flutter_rest_api_tutorial/Views/sign_up_view.dart';
import 'package:flutter_rest_api_tutorial/controller/login_controller.dart';
import 'package:flutter_rest_api_tutorial/controller/signup_controller.dart';
import 'package:get/get.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => LoginController()),
        ChangeNotifierProvider(create: (_) => SignUpController()),
      ],
      child: GetMaterialApp(
        title: 'GET API',
        theme: ThemeData(
          appBarTheme: AppBarTheme(color: Colors.cyan),
          colorScheme: ColorScheme.fromSeed(seedColor: Colors.cyan),
          scaffoldBackgroundColor: Colors.black12
        ),
        home: SignUpView(),
      ),
    );
  }
}
