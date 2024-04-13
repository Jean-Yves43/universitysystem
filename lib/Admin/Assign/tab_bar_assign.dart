import 'package:flutter/material.dart';
import 'package:university_management/Admin/Assign/assignListBSS.dart';
import 'package:university_management/Admin/Assign/assignListSTEM.dart';

class Department extends StatelessWidget {
  const Department({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: const Color.fromARGB(220, 6, 34, 190),
          title: const Text(
            'ASSIGN COURSE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true, // App bar title
        ),
        body: const Column(children: [
          // Column to hold TabBar and TabBarView
          TabBar(
            tabs: [
              // Tabs
              Tab(
                icon: Icon(Icons.admin_panel_settings,
                    color: Color.fromARGB(220, 6, 34, 190)),
              ),

              Tab(
                icon: Icon(
                  Icons.person,
                  color: Color.fromARGB(220, 6, 34, 190),
                ),
              ),
            ],
          ),
          Expanded(
            child: TabBarView(children: [
              // Content for each tab
              BBSList(),

              StemList(),
            ]),
          )
        ]),
      ),
    );
  }
}
