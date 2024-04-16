import 'package:flutter/material.dart';

import 'package:university_management/Admin/CreateCourse/Assign/tab_bar.dart';
import 'package:university_management/Admin/Create_Account/tab_bar.dart';

// ignore: must_be_immutable
class Dashboard extends StatelessWidget {
  var height, width;

  Dashboard({super.key});

  List imgSrc = [
    "assets/account+.png",
    "assets/course.png",
    
    
  ];

  List titles = [
    "Create/delete account",
    "Create/delete course",
  
  
  ];

  @override
  Widget build(BuildContext context) {
    height = MediaQuery.of(context).size.height;
    width = MediaQuery.of(context).size.width;
    return Scaffold(
      body: SizedBox(
        child: Container(
          color: Colors.indigo,
          width: width,
          child: Column(
            children: [
              Container(
                decoration: const BoxDecoration(),
                height: height * 0.25,
                width: width,
                child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(
                          top: 35,
                          left: 20,
                          right: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            InkWell(
                              onTap: () {},
                              child: const Icon(
                                Icons.arrow_back,
                                color: Colors.white,
                                size: 40,
                              ),
                            ),
                            Container(
                              height: 50,
                              width: 50,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  image: const DecorationImage(
                                      image: AssetImage('assets/profile.png'))),
                            )
                          ],
                        ),
                      ),
                      const Padding(
                        padding: EdgeInsets.only(
                          top: 20,
                          left: 30,
                        ),
                        child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("WELCOME",
                                  style: TextStyle(
                                    fontSize: 30,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w500,
                                    letterSpacing: 1,
                                  )),
                              SizedBox(
                                height: 10,
                              ),
                            ]),
                      )
                    ]),
              ),
              SingleChildScrollView(
                child: Container(
                    decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(30),
                        topRight: Radius.circular(30),
                      ),
                    ),
                    //height: height,
                    width: width,
                    padding: const EdgeInsets.symmetric(vertical: 50),
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 1.0,
                        mainAxisSpacing: 25,
                      ),
                      shrinkWrap: true,
                      physics: const NeverScrollableScrollPhysics(),
                      itemCount: imgSrc.length,
                      itemBuilder: (context, index) {
                        return InkWell(
                            onTap: () {
                              if (index == 0) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TabCreataAccount()),
                                );
                              } else if  (index == 1) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => TabCreateCourse()),
                                );
                              
                              };
                            },
                            child: Container(
                              margin: const EdgeInsets.symmetric(
                                  vertical: 8, horizontal: 20),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(20),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Colors.black26,
                                      spreadRadius: 1,
                                      blurRadius: 6,
                                    )
                                  ]),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Image.asset(
                                    imgSrc[index],
                                    width: 100,
                                  ),
                                  Text(
                                    titles[index],
                                    style: const TextStyle(
                                        fontSize: 20,
                                        fontWeight: FontWeight.bold),
                                  )
                                ],
                              ),
                            ));
                      },
                    )),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
