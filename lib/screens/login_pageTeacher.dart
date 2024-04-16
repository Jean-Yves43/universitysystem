import 'dart:async';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
import 'package:university_management/teacher/teacher_page.dart';

Future<void> loginTeacher(BuildContext context, String username,
    String password, String teacherID) async {
  // Construct the URL
  final url = Uri.parse(
      "http://10.0.2.2/universitymanagement_API/Teacher_api/login_teacher.php");

  // Send a POST request with the username, password, and teacherID as the body
  final response = await http.post(
    url,
    body: {
      'username': username,
      'password': password,
      'teacherID': teacherID,
    },
  );

  // Handle the response
  if (response.statusCode == 200) {
    // Parse the JSON response
    Map<String, dynamic> responseData = jsonDecode(response.body);

    // Check if the login was successful
    if (responseData.containsKey('success') &&
        responseData['success'] == true) {
      // Extract teacherID from the response data
      int teacherID = responseData['teacherID'] as int;
      // Navigate to TeacherPage with teacherID
      Navigator.of(context).push(
        MaterialPageRoute(
          builder: (context) => TeacherPage(teacherId: teacherID),
        ),
      );
    } else {
      // Show error message
      print(responseData['message']);
    }
  } else {
    // Show error message
    print('Failed to login. Please try again.');
  }
}

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController teacherIDController =
      TextEditingController(); // New field
  bool loading = false;

  void handleLogin(BuildContext context) async {
    setState(() {
      loading = true;
    });

    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String teacherID = teacherIDController.text.trim(); // Get teacherID

    if (username.isNotEmpty && password.isNotEmpty && teacherID.isNotEmpty) {
      // Check if all fields are filled
      try {
        await loginTeacher(
            context, username, password, teacherID); // Pass teacherID
      } catch (e) {
        print('Login Error: $e');
      }
    } else {
      print(
          'Please enter username, password, and teacherID'); // Handle if any field is empty
    }

    setState(() {
      loading = false;
    });
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
              const SizedBox(height: 40),
              const SizedBox(height: 15),
              const SizedBox(height: 30),
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
                    const SizedBox(height: 30),
                    const Text(
                      'Hello dear Teacher',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(height: 10),
                    const Text(
                      'Please Login to your account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    const SizedBox(height: 20),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: usernameController,
                        decoration: const InputDecoration(
                          labelText: 'Username',
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
                    Container(
                      // New field for teacherID
                      width: 250,
                      child: TextFormField(
                        controller: teacherIDController,
                        decoration: const InputDecoration(
                          labelText: 'Teacher ID',
                        ),
                      ),
                    ),
                    const Padding(
                      padding: EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forget Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(220, 6, 34, 190)))
                        ],
                      ),
                    ),
                    const SizedBox(height: 20),
                    InkWell(
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () => handleLogin(context),
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
