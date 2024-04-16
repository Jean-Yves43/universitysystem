import 'package:flutter/material.dart';

class PopUp extends StatelessWidget {
  final String studentId;
  final String studentName;

  const PopUp({
    Key? key,
    required this.studentId,
    required this.studentName,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    TextEditingController gradeController = TextEditingController();

    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Enter a new Grade for $studentName'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SizedBox(height: 10),
                TextFormField(
                  controller: gradeController,
                  decoration: const InputDecoration(
                    filled: true,
                    fillColor: Colors.white,
                    border: OutlineInputBorder(),
                    hintText: 'Enter new grade',
                  ),
                ),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  String newGrade = gradeController.text;
                  // Validate and handle new grade
                  if (newGrade.isNotEmpty) {
                    Navigator.pop(context);
                  } else {
                    // Handle empty grade
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(content: Text('Please enter a new grade')),
                    );
                  }
                },
                child: const Text('OK'),
              ),
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Colors.grey.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            ),
          ],
        ),
        child: Center(
          child: Text(
            'Modify',
            style: TextStyle(
              color: Colors.lightBlue,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
