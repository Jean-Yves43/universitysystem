import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_management/Admin/CreateCourse/Assign/registration_formCourseBSS.dart';

class BSSCourseAccount extends StatefulWidget {
  const BSSCourseAccount({Key? key}) : super(key: key);

  @override
  _BSSCourseAccountState createState() => _BSSCourseAccountState();
}

class _BSSCourseAccountState extends State<BSSCourseAccount> {
  final paymentListKey = GlobalKey<_BSSCourseAccountState>();

  static Future getAllCourse() async {
    var url = "http://10.0.2.2/api/BBScourseList.php";
    var response = await http.get(Uri.parse(url));
    print(response);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('BSS COURSE'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: getAllCourse(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('No data.'),
                        );
                      }

                      if (snapshot.hasError)
                        return Center(child: Text('${snapshot.error}'));

                      return ListView.builder(
                        scrollDirection: Axis.vertical,
                        shrinkWrap: true,
                        physics: const ScrollPhysics(),
                        itemCount: snapshot.data.length,
                        itemBuilder: (BuildContext context, int index) {
                          var data = snapshot.data[index];

                          return InkWell(
                            onTap: () {},
                            child: Card(
                              margin: const EdgeInsets.all(10),
                              color: Colors.white,
                              elevation: 1,
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  ListTile(
                                    leading: const Icon(
                                      Icons.person,
                                      color: Colors.tealAccent,
                                      size: 25,
                                    ),
                                    title: Text(
                                      'Course Name: ${data['courseName']}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'CourseID: ${data['courseID']}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          Navigator.push(
              context, MaterialPageRoute(builder: (context) => CreateCourse()));
        },
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black),
            height: 45,
            width: 90,
            child: const Center(
              child: Text(
                'Create',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
