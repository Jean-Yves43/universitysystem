import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class TeacherPage extends StatefulWidget {
  final int teacherId;

  const TeacherPage({Key? key, required this.teacherId}) : super(key: key);

  @override
  _TeacherPageState createState() => _TeacherPageState();
}

class _TeacherPageState extends State<TeacherPage> {
  late Future<List<dynamic>> _teacherCoursesFuture;

  @override
  void initState() {
    super.initState();
    _teacherCoursesFuture = getTeacherCourses(widget.teacherId);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          title: const Text('Teacher Page'),
        ),
        body: FutureBuilder<List<dynamic>>(
          future: _teacherCoursesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else if (snapshot.hasData) {
              List<dynamic> responseList = snapshot.data ?? [];
              return Column(
                children: <Widget>[
                  CategoriesScroller(),
                  Expanded(
                    child: responseList.isEmpty
                        ? Center(
                            child: Text(
                              'No courses selected',
                              style: TextStyle(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          )
                        : ListView.builder(
                            itemCount: responseList.length,
                            itemBuilder: (context, index) {
                              var course = responseList[index];
                              return Container(
                                height: 100,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 5),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20.0),
                                  color: Colors.white,
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withAlpha(100),
                                      blurRadius: 10.0,
                                    ),
                                  ],
                                ),
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      horizontal: 20.0, vertical: 5),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: <Widget>[
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: <Widget>[
                                          Text(
                                            course['courseName'] ?? '',
                                            style: const TextStyle(
                                                fontSize: 28,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          Text(
                                            course['courseID'].toString(),
                                            style: const TextStyle(
                                                fontSize: 17,
                                                color: Colors.grey),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                          ),
                  ),
                ],
              );
            } else {
              return Center(child: Text('No data available'));
            }
          },
        ),
      ),
    );
  }

  Future<List<dynamic>> getTeacherCourses(int teacherId) async {
    var url =
        "http://10.0.2.2/universitymanagement_API/Teacher_api/get_all_teacher_courses.php?teacher_id=$teacherId";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw e;
    }
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Handle assign grades action
                  // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => AssignGradesPage()));
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.orange.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Assign Grades",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle view student list action
                  // Example: Navigator.push(context, MaterialPageRoute(builder: (context) => StudentListPage()));
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Student's List",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
