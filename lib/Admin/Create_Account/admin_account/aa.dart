import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

import 'package:university_management/Admin/Create_Account/admin_account/registration_formAdmin.dart';

class AdminAccount extends StatefulWidget {
  const AdminAccount({Key? key}) : super(key: key);

  @override
  _AdminAccountState createState() => _AdminAccountState();
}

class _AdminAccountState extends State<AdminAccount> {
  final paymentListKey = GlobalKey<_AdminAccountState>();

  static Future getAllCourse() async {
    var url = "http://10.0.2.2/api/adminAccountList.php";
    var response = await http.get(Uri.parse(url));
    print(response);
    return json.decode(response.body);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Admin Account'),
      ),
      body: Container(
        margin: EdgeInsets.symmetric(horizontal: 30),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 50),
            Center(
              child: Column(
                children: <Widget>[
                  FutureBuilder(
                    future: getAllCourse(),
                    builder: (BuildContext context, AsyncSnapshot snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          child: const CircularProgressIndicator(),
                        );
                      }
                      if (!snapshot.hasData || snapshot.data == null) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.only(top: 20),
                          child: const Text('No data.'),
                        );
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
                                      'fullName: ${data['fullName']}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    subtitle: Text(
                                      'title: ${data['title']}',
                                      style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: MaterialButton(
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CreateAdminAccount()));
        },
        child: Center(
          child: Container(
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(10)),
                color: Colors.black),
            height: 45,
            width: 90,
            child: const Center(
              child: Text(
                'Create',
                style: TextStyle(fontSize: 20, color: Colors.white),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
