import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:university_management/Admin/Create_Account/admin_account/aa.dart';
//import 'package:university_management/login_page.dart';

class TabCreateCourse extends StatelessWidget {
  const TabCreateCourse({super.key}); // Constructor

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2, // Number of tabs
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Color.fromARGB(220, 6, 34, 190),
          title: Text(
            'CREATE COURSE',
            style: TextStyle(
              color: Colors.white,
              fontSize: 20,
              fontWeight: FontWeight.bold,
            ),
          ),
          centerTitle: true, // App bar title
        ),
        body: Column(children: [
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
              const Account(),

              const Account(),
            ]),
          )
        ]),
      ),
    );
  }
}
