//import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:flutter/material.dart';
//import 'package:flutter/widgets.dart';
import 'package:http/http.dart' as http;

class BBSList extends StatefulWidget {
 const BBSList({Key? key})
      : super(key: key);

  @override
 _CourseSectionState createState() =>
      _CourseSectionState();
}

// List<String> bss_cour = [
//   'Theater',
//   'English comp',
//   'Technical Com',
//   'American Government',
//   'Psychology',
// ];

// List<String> course_id = [
//   'HIST3305',
//   'ENG4302',
//   'COM4306',
//   'HIST3306',
//   'PSY2305'
// ];

class _CourseSectionState extends State<BBSList> {
  _CourseSectionState(

      {Key? key});

  final paymentListKey = GlobalKey<_CourseSectionState>();




  static Future getAllCourse() async {
   
    var url = "http://10.0.2.2/sms_api/GetAssignCourseBSS.php";
    var response = await http.get(Uri.parse(url));

    print(response);
    return json.decode(response.body);
  }

  // void iniState() {
  //   super.initState();
  //   getAllCourse();
  // }

  // static Future getAllCourse() async {
  //   var url = "http://10.0.2.2/universitymanagement_API/get_all_lines.php";
  // }

  

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     body: Container(
  //       color: Colors.white,
  //       child: ListView.builder(
  //         itemCount: bss_cour.length,
  //         shrinkWrap: true,
  //         itemBuilder: (BuildContext context, int index) => Container(
  //           width: MediaQuery.of(context).size.width,
  //           padding:
  //               const EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
  //           child: Card(
  //             elevation: 5.0,
  //             shape: RoundedRectangleBorder(
  //               borderRadius: BorderRadius.circular(0.0),
  //             ),
  //             child: Container(
  //               width: MediaQuery.of(context).size.width,
  //               padding: const EdgeInsets.symmetric(
  //                   horizontal: 10.0, vertical: 10.0),
  //               child: Row(
  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
  //                 crossAxisAlignment: CrossAxisAlignment.center,
  //                 children: <Widget>[
  //                   Column(
  //                     crossAxisAlignment: CrossAxisAlignment.start,
  //                     children: <Widget>[

  //                       Text(
  //                         bss_cour[index],
  //                         style: const TextStyle(
  //                           color: Colors.black,
  //                           fontSize: 18.0,
  //                           fontWeight: FontWeight.bold,
  //                         ),
  //                       ),
  //                       SizedBox(
  //                         height: 5.0,
  //                       ),
  //                       Text(
  //                         course_id[index],
  //                         style: const TextStyle(color: Colors.grey),
  //                       ),
  //                     ],
  //                   ),



  //                   Row(
  //                     children: [
  //                       Container(
  //                         alignment: Alignment.center,
  //                         padding: const EdgeInsets.symmetric(
  //                             horizontal: 10.0, vertical: 10.0),
  //                         child: TextButton(
  //                           onPressed: () {},
  //                           style: TextButton.styleFrom(
  //                             backgroundColor: Colors.lightBlue,
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(20.0),
  //                             ),
  //                           ),
  //                           child: const Text(
  //                             'Assign',
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                       SizedBox(width: 10), // Adding space between buttons
  //                       Container(
  //                         alignment: Alignment.center,
  //                         padding: const EdgeInsets.symmetric(
  //                             horizontal: 10.0, vertical: 10.0),
  //                         child: TextButton(
  //                           onPressed: () {},
  //                           style: TextButton.styleFrom(
  //                             backgroundColor: Colors.lightBlue,
  //                             shape: RoundedRectangleBorder(
  //                               borderRadius: BorderRadius.circular(20.0),
  //                             ),
  //                           ),
  //                           child: const Text(
  //                             'Unassign',
  //                             style: TextStyle(
  //                               color: Colors.white,
  //                             ),
  //                           ),
  //                         ),
  //                       ),
  //                     ],
  //                   ),
  //                 ],
  //               ),
  //             ),
  //           ),
  //         ),
  //       ),
  //     ),
  //   );
  // }

  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.symmetric(
          horizontal: 30,
        ),
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
          SizedBox(
            height: 50,
          ),

          Center(
            child: Column(
              children: <Widget>[
                FutureBuilder(
                    future: getAllCourse(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          //color: Colors.white,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            child: const CircularProgressIndicator());
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Container(
                          //color: Colors.white,
                            alignment: Alignment.center,
                            margin: const EdgeInsets.only(top: 20),
                            child: const Text('No data.'));
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
                              onTap: () {

                              },
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
                                        'CourseName: '
                                        '${data['CourseName']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'TeacherName: '
                                        '${data['TeacherName']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),

                                      ),

                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                    })
              ],
            ),
          ),



        ]));
  }
}
