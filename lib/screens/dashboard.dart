//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:university_management/screens/ItemDashboard.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({Key? key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary.withOpacity(.2),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          const SizedBox(height: 100),
          Text(
            'Please, who are you',
            style: Theme.of(context).textTheme.headline6?.copyWith(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                letterSpacing: 2),
          ),
          const SizedBox(height: 10),
          const SizedBox(height: 30),
          const SizedBox(height: 20),
          Expanded(
            child: Container(
              padding: const EdgeInsets.only(top: 20),
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(50),
                  topRight: Radius.circular(50),
                ),
                color: Colors.white,
              ),
              child: GridView.count(
                padding:
                    const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                crossAxisCount: 2,
                mainAxisSpacing: 10,
                crossAxisSpacing: 10,
                children: const [
                  ItemDashboard(title: 'Admin', image: 'assets/admin.jpeg'),
                  ItemDashboard(title: 'Teacher', image: 'assets/teacher.jpeg'),
                  ItemDashboard(title: 'Student', image: 'assets/student.jpeg'),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
