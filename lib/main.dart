import 'package:flutter/material.dart';
import 'package:flutter_rfv2/modules/login/login.dart';
import 'package:flutter_rfv2/modules/products/productView.dart';
import 'package:flutter_rfv2/pages/homePage.dart';
import 'common/app_constants.dart';
import 'package:flutter_rfv2/routes/routes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var theme = ThemeData(
      fontFamily: "Roboto",
      primaryColor: Colors.yellow[600],
    );
    return MaterialApp(
      title: AppConstants.appTitle,
      debugShowCheckedModeBanner: false,
      theme: theme,
      home: LoginScreen(),
      routes:  {
        Routes.products: (context) => ProductsView(),
        Routes.home: (context) => HomePage(),
        Routes.login: (context) => LoginScreen(),
      },
    );
  }
}