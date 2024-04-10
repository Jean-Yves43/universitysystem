//import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
//import 'package:university_management/Admin/Assign/assignListBSS.dart';

class StemList extends StatefulWidget {
  const StemList({Key? key});

  @override
  State<StemList> createState() => _AccountState();
}

List<String> stem_cour = [
  'Software Engineering',
  'Information Security',
  'Data Mining',
  'Design Algorithm',
  'Principles of Data Science',
];

List<String> CourseId = ['CSC3305', 'CSC4302', 'CSC4306', 'CSC3306', 'DSC2305'];

class _AccountState extends State<StemList> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: ListView.builder(
          itemCount: stem_cour.length,
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => Container(
            width: MediaQuery.of(context).size.width,
            padding:
                const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
            child: Card(
              elevation: 5.0,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(0.0),
              ),
              child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.symmetric(
                    horizontal: 10.0, vertical: 10.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: <Widget>[
                        Text(
                          stem_cour[index],
                          style: const TextStyle(
                            color: Colors.black,
                            fontSize: 18.0,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        SizedBox(
                          height: 5.0,
                        ),
                        Text(
                          CourseId[index],
                          style: const TextStyle(color: Colors.grey),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        /*  Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text(
                              'ASSIGN COURSE',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                        */
                        SizedBox(width: 10), // Adding space between buttons
                        Container(
                          alignment: Alignment.center,
                          padding: const EdgeInsets.symmetric(
                              horizontal: 10.0, vertical: 10.0),
                          child: TextButton(
                            onPressed: () {},
                            style: TextButton.styleFrom(
                              backgroundColor: Colors.lightBlue,
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(20.0),
                              ),
                            ),
                            child: const Text(
                              'Unassign',
                              style: TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
