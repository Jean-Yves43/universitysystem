import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_management/Admin/CreateCourse/Assign/tab_bar.dart';
import 'package:university_management/Admin/Create_Account/tab_bar.dart';

class CreateCourse extends StatefulWidget {
  const CreateCourse({Key? key}) : super(key: key);

  @override
  State<CreateCourse> createState() => _CreateCourseState();
}

class _CreateCourseState extends State<CreateCourse> {
  TextEditingController courseIDController = TextEditingController();
  TextEditingController courseDepController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController creditController = TextEditingController();
  TextEditingController maxPlacesController = TextEditingController();
  TextEditingController teacherIDController = TextEditingController();
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
                    'Create course',
                    style: TextStyle(fontSize: 25, color: Colors.white),
                  ),
                ),
                const SizedBox(height: 30),
                TextFormField(
                  controller: courseIDController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter the course ID'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: courseDepController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter the department of the course'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: courseNameController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter course name'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: creditController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter the number of credits'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: maxPlacesController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter the maximum number of places'),
                ),
                const SizedBox(
                  height: 20,
                ),
                TextFormField(
                  controller: teacherIDController,
                  decoration: const InputDecoration(
                      filled: true,
                      fillColor: Colors.white,
                      border: OutlineInputBorder(),
                      hintText: 'Enter the techer ID '),
                ),
                //const SizedBox(
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
    String courseID = courseIDController.text.trim();
    String courseDep = courseDepController.text.trim();
    String courseName = courseNameController.text.trim();
    String credit = creditController.text.trim();
    String maxPlaces = maxPlacesController.text.trim();
    String teacherID = teacherIDController.text.trim();

    if (courseID.isNotEmpty &&
        courseDep.isNotEmpty &&
        courseName.isNotEmpty &&
        credit.isNotEmpty &&
        maxPlaces.isNotEmpty &&
        teacherID.isNotEmpty) {
      // Add the user to the list
      users.add({
        'courseID': courseID,
        'courseDep': courseDep,
        'courseName': courseName,
        'credit': credit,
        'maxPlaces': maxPlaces,
        'teacherID': teacherID,
        'type': userType,
      });

      // Clear the text fields after registration
      courseIDController.clear();
      courseDepController.clear();

      courseNameController.clear();
      creditController.clear();
      maxPlacesController.clear();
      teacherIDController.clear();

      // Save user to backend
      await saveUser();

      // Navigate to the AdminAccount page
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabCreateCourse()),
      );
    } else {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context)
          .showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }

  Future<void> saveUser() async {
    String courseID = courseIDController.text;
    String courseDep = courseDepController.text;
    String courseName = courseNameController.text;
    String credit = creditController.text;
    String maxPlaces = maxPlacesController.text;
    String teacherID = teacherIDController.text;

    var url = "http://10.0.2.2/api/registerCourseStem.php";
    var response = await http.post(Uri.parse(url), body: {
      'courseID': courseID.toString(),
      'courseDep': courseDep.toString(),
      'courseName': courseName.toString(),
      'credit': credit.toString(),
      'maxPlaces': maxPlaces.toString(),
      'teacherID': teacherID.toString(),
    });

    print(response.body);
  }
}
