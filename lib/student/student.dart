import 'package:flutter/material.dart';
import 'package:university_management/student/square.dart';

class StudentPage extends StatelessWidget {
  const StudentPage({Key? key}) : super(key: key); // Mark constructor as const

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Container(
                    height: 100,
                    width: 100,
                    decoration: const BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.pink,
                    ),
                  ),
                )
              ],
            ),
          ),
          Expanded(
            child: ListView.builder(
              itemCount: 3, // Adjust the count based on your data
              itemBuilder: (context, index) {
                return MySquare();
              },
            ),
          ),
        ],
      ),
    );
  }
}
