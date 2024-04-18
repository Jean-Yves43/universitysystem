import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_management/teacher/teacher_page.dart';

Future<Map<String, dynamic>> login(int teacherID, String password) async {
  try {
    var response = await http.post(
      Uri.parse(
          "http://10.0.2.2/universitymanagement_API/Teacher_api/login_teacher.php"),
      body: {
        'teacherID': teacherID.toString(),
        'password': password,
      },
    );

    if (response.statusCode == 200) {
      return json.decode(response.body); // Decode JSON response
    } else {
      throw Exception('Failed to login');
    }
  } catch (e) {
    print('Error during login: $e');
    throw Exception('Failed to login. Please check your internet connection.');
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController teacherIDController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  void handleLogin() async {
    setState(() {
      loading = true;
    });

    int? teacherID = int.tryParse(teacherIDController.text.trim());
    String password = passwordController.text.trim();

    if (teacherID != null && teacherID > 0 && password.isNotEmpty) {
      try {
        Map<String, dynamic> response = await login(teacherID, password);
        if (response['success']) {
          Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => TeacherPage(
              teacherId: teacherID,
            ),
          ));
          showSnackbar('Login successful');
        } else {
          showSnackbar(response['message']);
        }
      } catch (e) {
        showSnackbar('Failed to login. Please try again later.');
      }
    } else {
      showSnackbar('Please enter a valid username and password.');
    }

    setState(() {
      loading = false;
    });
  }

  void showSnackbar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(message),
        duration: Duration(seconds: 3),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                Color.fromARGB(220, 6, 34, 190),
                Color.fromARGB(255, 226, 248, 85),
                Color.fromARGB(255, 255, 251, 248),
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(
                height: 40,
              ),
              const SizedBox(
                height: 15,
              ),
              const SizedBox(
                height: 30,
              ),
              Container(
                height: 480,
                width: 325,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    const SizedBox(
                      height: 30,
                    ),
                    const Text(
                      'Hello dear Teacher ',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Please Login to your account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: teacherIDController,
                        decoration: const InputDecoration(
                          labelText: 'TeacherID',
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: passwordController,
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text(
                            'Forget Password?',
                            style: TextStyle(
                                color: Color.fromARGB(220, 6, 34, 190)),
                          )
                        ],
                      ),
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: loading ? null : handleLogin,
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: loading ? null : handleLogin,
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(220, 6, 34, 190),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                        ),
                      ),
                    ),
                    if (loading)
                      CircularProgressIndicator(), // Show loading indicator
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
