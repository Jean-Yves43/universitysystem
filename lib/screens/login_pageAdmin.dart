import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_management/Admin/admin_page.dart';

// Separate login logic into a separate function
Future<String> login(String username, String password) async {
  try {
    // Make HTTP POST request to the login API endpoint
    var response = await http.post(
      Uri.parse("http://10.0.2.2/universitymanagement_API/login.php"),
      body: {'username': username, 'password': password},
    );

    if (response.statusCode == 200) {
      // If login is successful, return the response body
      return response.body;
    } else {
      // If there's an error, throw an exception
      throw Exception('Failed to login');
    }
  } catch (e) {
    // Handle network errors or server errors gracefully
    print('Error: $e');
    throw Exception('Failed to login');
  }
}

class LoginPageAdmin extends StatefulWidget {
  const LoginPageAdmin({Key? key}) : super(key: key);

  @override
  State<LoginPageAdmin> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPageAdmin> {
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  bool loading = false;

  // Function to handle the login process
  Future<void> handleLogin() async {
    // Show loading indicator
    setState(() {
      loading = true;
    });

    String username = usernameController.text.trim();
    String password = passwordController.text.trim();

    try {
      // Call the login function
      String response = await login(username, password);

      // Check if the widget is still mounted before calling setState
      if (mounted) {
        setState(() {
          loading = false; // Hide loading indicator
        });
      }

      if (response != '[]') {
        // Navigate to the dashboard page upon successful login
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (context) => Dashboard()));
      } else {
        // Print error message if user not found
        print("User not found");
      }
    } catch (e) {
      // Handle login errors gracefully
      print('Login Error: $e');
      if (mounted) {
        setState(() {
          loading = false; // Hide loading indicator
        });
      }
    }
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
              ])),
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
                      'Hello dear admin ',
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
                        controller:
                            usernameController, // Assign email controller
                        decoration: const InputDecoration(
                          labelText: 'Username',
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller:
                            passwordController, // Assign password controller
                        obscureText: true,
                        decoration: const InputDecoration(
                          labelText: 'Password',
                          // suffixIcon: Icon(FontAwesomeIcons.envelope,size:17,),
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
                    const SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap:
                          handleLogin, // Call handleLogin function when tapped
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () {
                              // Call handleLogin function when button pressed
                              handleLogin();
                            },
                            style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromARGB(220, 6, 34, 190),
                            ),
                            child: const Text(
                              'Login',
                              style: TextStyle(
                                  color: Colors.white,
                                  fontSize: 20,
                                  fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                      ),
                    ),
                    // Show loading indicator if loading is true
                    if (loading)
                      const Padding(
                        padding: EdgeInsets.all(16.0),
                        child: CircularProgressIndicator(),
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
