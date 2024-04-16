import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


import 'package:university_management/student/HomePagestudent.dart';





class Add_Course extends StatefulWidget {
  const Add_Course({Key? key}) : super(key: key);

  @override
  State<Add_Course> createState() => _Add_CourseState();
}

class _Add_CourseState extends State<Add_Course> {
  TextEditingController courseIDController = TextEditingController();
  
  TextEditingController courseNameController = TextEditingController();
 
  String userType = 'Student';
  
  get users => null; // Default user type

   Future saveUser() async {
    String courseID = courseIDController.text;
   
    String courseName= courseNameController.text;
    

    var url = "http://10.0.2.2/api/registerCourseStem.php";
    var response = await http.post(Uri.parse(url),
    body: {
      'courseID': courseID.toString(),
     
      'courseName': courseName.toString(),
     
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
                              'Add',
                              style:
                                  TextStyle(fontSize: 20, color: Colors.white),
                            ),
                          ),
                        ),
                      ), 
                      
                      onPressed: () {
                      MaterialPageRoute(builder: (context) => StudentPage());
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
  
    String courseName = courseNameController.text.trim();
    


    if (courseID .isNotEmpty  && courseName.isNotEmpty   ) {
      // Add the user to the list
      users.add({
        'courseID': courseID,
        
        'courseName' : courseName,
        
        'type': userType,
      });

      // Clear the text fields after registration
      courseIDController.clear();
    
    
      courseNameController.clear();
     

      // Navigate to the ListUser screen to view all registered users
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => StudentPage(

        )),
      );
    } else {
      // Show an error message if any field is empty
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text('Please fill all fields')));
    }
  }
}
