import 'package:flutter/material.dart';
import 'package:university_management/Admin/admin_page.dart';
import 'package:http/http.dart' as http;

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  @override
  Widget build(BuildContext context) {
    TextEditingController usernameController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

    Future login() async {
      String username = usernameController.text.toString();
      String password = passwordController.text.toString();
      print(username);
      print(password);
      var response = await http.get(Uri.parse(
          "http://10.0.2.2/universitymanagement_API/login.php?username=$username&password=$password"));

      print(response.body);
      return response.body;
      // return json.decode(response.body);
    }

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
                      onTap: () {
                        // Add login functionality here
                        String email = usernameController.text;
                        String password = passwordController.text;

                        // Validate email and password
                        if (email.isNotEmpty && password.isNotEmpty) {
                          // Perform login
                          print('Username: $email, Password: $password');
                          // Implement your login logic here
                        } else {
                          // Show error message or handle invalid input
                          print('Please enter username and password');
                        }
                      },
                      child: Container(
                        alignment: Alignment.center,
                        width: 250,
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: ElevatedButton(
                            onPressed: () async {
                              String r = await login();
                              if (r != '[]') {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => Dashboard()));
                              } else {
                                print("User not found");
                              }
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
