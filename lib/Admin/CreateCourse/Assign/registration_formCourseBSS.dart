import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:university_management/Admin/CreateCourse/Assign/tab_bar.dart';





class CreateAdminAccount extends StatefulWidget {
  const CreateAdminAccount({Key? key}) : super(key: key);

  @override
  State<CreateAdminAccount> createState() => _CreateAdminAccountState();
}

class _CreateAdminAccountState extends State<CreateAdminAccount> {
  TextEditingController courseIDController = TextEditingController();
  TextEditingController courseDepController = TextEditingController();
  TextEditingController courseNameController = TextEditingController();
  TextEditingController creditController = TextEditingController();
  TextEditingController maxPlacesController = TextEditingController();
 TextEditingController teacherIDController = TextEditingController();
  String userType = 'Student';
  
  get users => null; // Default user type

   Future saveUser() async {
    String courseID = courseIDController.text;
    String courseDep = courseDepController.text;
    String courseName= courseNameController.text;
    String credit = creditController.text;
    String maxPlaces = maxPlacesController.text;
    String teacherID = teacherIDController.text;
    

    var url = "http://10.0.2.2/api/registerCourseStem.php";
    var response = await http.post(Uri.parse(url),
    body: {
      'courseID': courseID.toString(),
      'courseDep': courseDep.toString(),
      'courseName': courseName.toString(),
      'credit'   : credit.toString(),
      'maxPlaces' : maxPlaces.toString(),
      'teacherID' : teacherID.toString(),
    }
    );


    print(response.body);
   // return json.decode(response.body);


  }

//class RegistrationFormAdmin extends StatelessWidget {
 // const RegistrationFormAdmin({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xff154C79),
        body: SafeArea(
          child: SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
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
                      const SizedBox(
                        height: 30,
                      ),
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
                      const SizedBox(
                        height: 20,
                      ),
                     
                      const SizedBox(
                        height: 55,
                      ),
                      MaterialButton(
                      child: Center(
                        child: Container(
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10)),
                              color: Colors.white),
                          height: 45,
                          width: 90,
                          child: const Center(
                            
                            child: Text(
                              'Assign',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ), 
                      
                      onPressed: () {
                      MaterialPageRoute(builder: (context) => TabCreateCourse());
                      //_registerUser(userType);
                      saveUser();
                    },
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        ));
  }

   void _registerUser(String userType) {
    String courseID  = courseIDController.text.trim();
    String courseDep = courseDepController.text.trim();
    String courseName = courseNameController.text.trim();
    String credit = creditController.text.trim();
    String maxPlaces = maxPlacesController.text.trim();
   String teacherID = teacherIDController.text.trim();


    if (courseID .isNotEmpty && courseDep.isNotEmpty && courseName.isNotEmpty && credit.isNotEmpty && maxPlaces.isNotEmpty && teacherID.isNotEmpty  ) {
      // Add the user to the list
      users.add({
        'courseID': courseID,
        'courseDep': courseDep,
        'courseName' : courseName,
         'credit' : credit,
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

      // Navigate to the ListUser screen to view all registered users
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => TabCreateCourse(

        )),
      );
    } else {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }
}
