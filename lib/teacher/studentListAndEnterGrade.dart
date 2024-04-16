import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';
import 'package:university_management/teacher/popUp.dart';

class StudentGrade extends StatefulWidget {
  final int teacherId;

  StudentGrade({Key? key, required this.teacherId}) : super(key: key);

  @override
  State<StudentGrade> createState() => _StudentGradeState();
}

class _StudentGradeState extends State<StudentGrade> {
  late Future<List<Map<String, dynamic>>> _studentsFuture;

  @override
  void initState() {
    super.initState();
    _studentsFuture = getAllStudents(widget.teacherId);
  }

  Future<List<Map<String, dynamic>>> getAllStudents(int teacherId) async {
    final url = Uri.parse(
        "http://10.0.2.2/universitymanagement_API/Teacher_api/get_all_student.php?teacher_id=$teacherId");
    final response = await http.get(url);

    if (response.statusCode == 200) {
      final List<dynamic> data = json.decode(response.body);
      return List<Map<String, dynamic>>.from(data);
    } else {
      throw Exception('Failed to load student data');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.lightBlue,
        title: const Text(
          'Student Grade',
          style: TextStyle(
            color: Colors.white,
          ),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back,
            color: Colors.black,
            size: 25,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Container(
        color: Colors.white,
        child: FutureBuilder<List<Map<String, dynamic>>>(
          future: _studentsFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              return Center(child: Text('Error: ${snapshot.error}'));
            } else {
              final List<Map<String, dynamic>> students = snapshot.data!;
              return ListView.builder(
                itemCount: students.length,
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  final student = students[index];
                  return ListTile(
                    title: Text(
                      student['name'],
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    subtitle: Text(
                      student['id'],
                      style: TextStyle(color: Colors.grey),
                    ),
                    trailing: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        TextButton(
                          onPressed: () {},
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            student['grade'],
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                        SizedBox(width: 10),
                        TextButton(
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => PopUp(
                                studentId: student['id'],
                                studentName: student['name'],
                              ),
                            );
                          },
                          style: TextButton.styleFrom(
                            backgroundColor: Colors.lightBlue,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(20.0),
                            ),
                          ),
                          child: Text(
                            'Modify',
                            style: TextStyle(color: Colors.white),
                          ),
                        ),
                      ],
                    ),
                  );
                },
              );
            }
          },
        ),
      ),
    );
  }
}
