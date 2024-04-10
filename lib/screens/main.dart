import 'package:flutter/material.dart';
//import 'package:university_management/Admin/admin_page.dart';
//import 'package:university_management/screens/dashboard.dart';
import 'package:university_management/screens/home_page.dart';
//import 'package:university_management/student/student.dart';
//import 'package:university_management/Admin/Create_Account/admin_account/registration_form.dart';
//import 'package:university_management/screens/home_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: SplashScreen(), // Use SplashScreen here
    );
  }
}
