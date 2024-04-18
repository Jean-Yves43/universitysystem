import 'dart:convert';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:university_management/student/add_Course.dart';
import 'package:university_management/student/viewGrade.dart';

class StudentPage extends StatefulWidget {
  const StudentPage({Key? key}) : super(key: key);

  @override
  State<StudentPage> createState() => _StudentPageState();
}

class _StudentPageState extends State<StudentPage> {
  final CategoriesScroller categoriesScroller = const CategoriesScroller();
  ScrollController controller = ScrollController();
  bool closeTopContainer = false;
  double topContainer = 0;
  late Future<List<dynamic>> _coursesFuture;

  @override
  void initState() {
    super.initState();
    _coursesFuture = getAllLines();
    controller.addListener(() {
      double value = controller.offset / 119;
      setState(() {
        topContainer = value;
        closeTopContainer = controller.offset > 50;
      });
    });
  }

  Future<List<dynamic>> getAllLines() async {
    var url = "http://10.0.2.2/api/homePage.php";
    try {
      var response = await http.get(Uri.parse(url));
      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load courses');
      }
    } catch (e) {
      print('Error fetching data: $e');
      throw Exception('Failed to load courses');
    }
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;
    final double categoryHeight = size.height * 0.30;
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          leading: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
          actions: <Widget>[
            IconButton(
              icon: const Icon(Icons.person, color: Colors.black),
              onPressed: () {},
            )
          ],
        ),
        body: FutureBuilder<List<dynamic>>(
          future: _coursesFuture,
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return Center(
                child: CircularProgressIndicator(),
              );
            } else if (snapshot.hasError) {
              return Center(
                child: Text('Error: ${snapshot.error}'),
              );
            } else {
              List<dynamic>? responseList = snapshot.data;
              if (responseList == null || responseList.isEmpty) {
                return Center(
                  child: Text(
                    'No courses selected',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                );
              } else {
                List<Widget> listItems = [];
                for (var post in responseList) {
                  listItems.add(
                    Container(
                      height: 150,
                      margin: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 10),
                      decoration: BoxDecoration(
                        borderRadius:
                            const BorderRadius.all(Radius.circular(20.0)),
                        color: Colors.white,
                        boxShadow: [
                          BoxShadow(
                              color: Colors.black.withAlpha(100),
                              blurRadius: 10.0),
                        ],
                      ),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20.0, vertical: 10),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: <Widget>[
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: <Widget>[
                                Text(
                                  post['courseName'],
                                  style: const TextStyle(
                                    fontSize: 28,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  post['courseID'],
                                  style: const TextStyle(
                                      fontSize: 17, color: Colors.grey),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ),
                  );
                }
                return Column(
                  children: [
                    AnimatedOpacity(
                      duration: const Duration(milliseconds: 200),
                      opacity: closeTopContainer ? 0 : 1,
                      child: AnimatedContainer(
                        duration: const Duration(milliseconds: 200),
                        width: size.width,
                        alignment: Alignment.topCenter,
                        height: closeTopContainer ? 0 : categoryHeight,
                        child: categoriesScroller,
                      ),
                    ),
                    Expanded(
                      child: ListView(
                        controller: controller,
                        children: listItems,
                      ),
                    ),
                  ],
                );
              }
            }
          },
        ),
      ),
    );
  }
}

class CategoriesScroller extends StatelessWidget {
  const CategoriesScroller({Key? key});

  @override
  Widget build(BuildContext context) {
    final double categoryHeight =
        MediaQuery.of(context).size.height * 0.30 - 50;
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      scrollDirection: Axis.horizontal,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
        child: FittedBox(
          fit: BoxFit.fill,
          alignment: Alignment.topCenter,
          child: Row(
            children: <Widget>[
              GestureDetector(
                onTap: () {
                  // Handle view student list action
                  Example:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => Add_Course()));
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "Add courses",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              GestureDetector(
                onTap: () {
                  // Handle view student list action
                  Example:
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => SeeGrade()));
                },
                child: Container(
                  width: 150,
                  margin: const EdgeInsets.only(right: 20),
                  height: categoryHeight,
                  decoration: BoxDecoration(
                    color: Colors.blue.shade400,
                    shape: BoxShape.circle,
                  ),
                  child: const Padding(
                    padding: EdgeInsets.all(12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: <Widget>[
                        Text(
                          "View grade",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontSize: 25,
                              color: Colors.white,
                              fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
