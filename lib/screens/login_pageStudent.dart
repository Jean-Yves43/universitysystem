import 'package:flutter/material.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();

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
              SizedBox(
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
                    SizedBox(
                      height: 30,
                    ),
                    Text(
                      'Hello dear student',
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    SizedBox(
                      height: 10,
                    ),
                    Text(
                      'Please Login to your account',
                      style: TextStyle(fontSize: 15, color: Colors.grey),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller: emailController, // Assign email controller
                        decoration: InputDecoration(
                          labelText: 'Username',
                          // suffixIcon: Icon(FontAwesomeIcons.envelope,size:17,),
                        ),
                      ),
                    ),
                    Container(
                      width: 250,
                      child: TextFormField(
                        controller:
                            passwordController, // Assign password controller
                        obscureText: true,
                        decoration: InputDecoration(
                          labelText: 'Password',
                          // suffixIcon: Icon(FontAwesomeIcons.envelope,size:17,),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.fromLTRB(20, 20, 40, 20),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          Text('Forget Password?',
                              style: TextStyle(
                                  color: Color.fromARGB(220, 6, 34, 190)))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    InkWell(
                      onTap: () {
                        // Add login functionality here
                        String email = emailController.text;
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
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(50),
                            color: Color.fromARGB(220, 6, 34, 190)),
                        child: Padding(
                          padding: const EdgeInsets.all(12.0),
                          child: Text(
                            'Login',
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 20,
                                fontWeight: FontWeight.bold),
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
