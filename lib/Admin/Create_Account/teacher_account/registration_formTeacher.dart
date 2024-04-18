import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_management/Admin/Create_Account/tab_bar.dart';

class CreateTeacherAccount extends StatefulWidget {
  const CreateTeacherAccount({Key? key}) : super(key: key);

  @override
  State<CreateTeacherAccount> createState() => _CreateTeacherAccountState();
}

class _CreateTeacherAccountState extends State<CreateTeacherAccount> {
  TextEditingController fullNameController = TextEditingController();
  TextEditingController usernameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  TextEditingController DepController = TextEditingController();
  TextEditingController phoneNumberController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  String userType = 'Student';

  List<Map<String, dynamic>> users = []; // Default user type

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xff154C79),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
            child: Column(
              children: [
                Container(
                  margin: const EdgeInsets.only(top: 30),
                  alignment: Alignment.center,
                  child: const Text(
                    'Create account',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: fullNameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter the full name',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: usernameController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter the username',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: passwordController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter password',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: phoneNumberController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter the phone number',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: addressController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter the address',
                  ),
                ),
                const SizedBox(height: 20),
                TextFormField(
                  controller: DepController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter the department',
                  ),
                ),
                const SizedBox(height: 55),
                MaterialButton(
                  onPressed: () {
                    _registerUser(
                        userType); // Call the function to register the user
                  },
                  child: Container(
                    decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(10)),
                      color: Colors.white,
                    ),
                    height: 45,
                    width: 90,
                    child: Center(
                      child: Text(
                        'Create',
                        style: TextStyle(fontSize: 20, color: Colors.black),
                      ),
                    ),
                  ),
                ),
                const SizedBox(height: 15),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _registerUser(String userType) async {
    String fullName = fullNameController.text.trim();
    String username = usernameController.text.trim();
    String password = passwordController.text.trim();
    String department = DepController.text.trim();
    String address = addressController.text.trim();
    String phone = phoneNumberController.text.trim();

    if (fullName.isNotEmpty &&
        username.isNotEmpty &&
        password.isNotEmpty &&
        department.isNotEmpty &&
        address.isNotEmpty &&
        phone.isNotEmpty) {
      // Add the user to the list
      users.add({
        'fullName': fullName,
        'username': username,
        'password': password,
        'department': department,
        'address': address,
        'phone': phone,
        'type': userType,
      });

      // Clear the text fields after registration
      fullNameController.clear();
      usernameController.clear();
      passwordController.clear();
      DepController.clear();
      addressController.clear();
      phoneNumberController.clear();

      // Save user to backend
      await saveUser();

      // Navigate to the AdminAccount page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabCreataAccount()),
      );
    } else {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }

  Future<void> saveUser() async {
    String fullName = fullNameController.text;
    String userName = usernameController.text;
    String password = passwordController.text;
    String department = DepController.text;
    String phone = phoneNumberController.text;
    String address = addressController.text;

    var url = "http://10.0.2.2/api/registrationFormTeacher.php";
    var response = await http.post(Uri.parse(url), body: {
      'fullname': fullName.toString(),
      'username': userName.toString(),
      'password': password.toString(),
      'department': department.toString(),
      'address': address.toString(),
      'phone': phone.toString(),
    });

    print(response.body);
  }
}
