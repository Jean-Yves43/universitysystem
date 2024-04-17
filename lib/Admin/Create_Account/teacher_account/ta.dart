import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class TeacherAccount extends StatefulWidget {
  const TeacherAccount({Key? key}) : super(key: key);

  @override
  _TeacherAccountState createState() => _TeacherAccountState();
}

// List<String> name = [
//   'Manouan Jean-yves',
//   'Dosso Marienne',
//   'Konan Brandon',
//   'Nguessan Yapi',
//   'Mbazumutima Teddy',
// ];

// List<String> id = ['106077', '105098', '105034', '109773', '107466'];

class _TeacherAccountState extends State<TeacherAccount> {
  _TeacherAccountState({Key? key});

  final paymentListKey = GlobalKey<_TeacherAccountState>();

  static Future getAllCourse() async {
    var url = "http://10.0.2.2/api/teacherAccountList.php";
    var response = await http.get(Uri.parse(url));

    print(response);
    return json.decode(response.body);
  }

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
                                        'fullName: '
                                        '${data['fullName']}',
                                        style: const TextStyle(
                                            fontSize: 20,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      subtitle: Text(
                                        'department: '
                                        '${data['department']}',
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
