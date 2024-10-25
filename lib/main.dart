import 'package:cloths_app/users/Localisation/local_string.dart';
import 'package:cloths_app/users/authentication/login_screen.dart';
import 'package:cloths_app/users/authentication/spalsh_screen.dart';
import 'package:cloths_app/users/fragements/order_fragement_screen.dart';
import 'package:cloths_app/users/orders/order_details.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();


  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      translations: LocalString(),
      locale: Locale('en','US'),
      title: 'Cloths App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

      primarySwatch: Colors.blue
      ),
     // home:  LoginScreen(),
      home:SplashScreen()
      // home:OrderFragementScreen()

    );
  }
}

