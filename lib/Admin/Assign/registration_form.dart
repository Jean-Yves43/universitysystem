import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:university_management/Admin/Assign/tab_bar_assign.dart';




class AssignCourse extends StatefulWidget {
  const AssignCourse({Key? key}) : super(key: key);

  @override
  State<AssignCourse> createState() => _AssignCourse();
}

class _AssignCourse extends State<AssignCourse> {
  TextEditingController CourseIDController = TextEditingController();
  TextEditingController TeacherIDController = TextEditingController();
 
  String userType = 'Student';
  
  get users => null; // Default user type

   Future saveUser() async {
    String CourseID = CourseIDController.text;
    String TeacherID = TeacherIDController.text;
    

    var url = "http://10.0.2.2/api/saveAssignedCourse.php";


    var response = await http.post(Uri.parse(url),
    body: {
      'CourseID': CourseIDController.toString(),
      'TeacherID': TeacherIDController.toString(),
      
    }
    );


    print(response.body);
   // return json.decode(response.body);


  }

//class RegistrationForm extends StatelessWidget {
  //const RegistrationForm({Key? key}) : super(key: key);

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
                          'Assing Course',
                          style: TextStyle(fontSize: 25, color: Colors.white),
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      TextFormField(
                        controller: CourseIDController,
                        decoration: const InputDecoration(
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Enter the name of the course'),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      TextFormField(
                        controller: TeacherIDController,
                        decoration: const InputDecoration(
                          
                            filled: true,
                            fillColor: Colors.white,
                            border: OutlineInputBorder(),
                            hintText: 'Enter the id'),
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
                      MaterialPageRoute(builder: (context) => Department());
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

  void _AssignCoursee(String userType) {
    String CourseID = CourseIDController.text.trim();
    String TeacherID = TeacherIDController.text.trim();
    ;
    
    

    if (CourseID.isNotEmpty && TeacherID.isNotEmpty ) {
      // Add the user to the list
      users.add({
        'CourseID': CourseID,
        'TeacherID': TeacherID,
        
        'type': userType,
      });

      // Clear the text fields after registration
      CourseIDController.clear();
      TeacherIDController.clear();
      
      

      // Navigate to the ListUser screen to view all registered courses
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => Department(

        )),
      );
    } else {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }
} 