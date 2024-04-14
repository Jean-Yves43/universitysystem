import 'dart:async';

import 'package:flutter/material.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:university_management/teacher/teacher_page.dart';
//import 'package:university_management/screens/login_pageAdmin.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with TickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _rotationAnimation;
  late Animation<double> _radiusAnimation;

  @override
  void initState() {
    super.initState();

    _controller =
        AnimationController(vsync: this, duration: const Duration(seconds: 2))
          ..forward();

    _rotationAnimation = Tween(begin: -1.0, end: 2 * 3.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _radiusAnimation = Tween(begin: 450.0, end: 10.0)
        .animate(CurvedAnimation(parent: _controller, curve: Curves.easeInOut));

    _controller.addListener(() {
      setState(() {});
    });

    _controller.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        _controller.reverse();
      } else if (status == AnimationStatus.dismissed) {
        _controller.forward();
      }
    });

    // Start timer to navigate after 7 seconds
    Timer(const Duration(seconds: 5), () {
      start(context);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 38, 98, 202),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SizedBox(
            width: 250.0,
            child: DefaultTextStyle(
              style: const TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                fontFamily: 'DancingScript',
                color: Color.fromARGB(255, 247, 247, 101),
              ),
              child: AnimatedTextKit(
                animatedTexts: [
                  TyperAnimatedText('WELCOME TO IUGB PORTAL'),
                ],
              ),
            ),
          ),
          const SizedBox(height: 50), // Add some space between text and image
          Center(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Transform.rotate(
                  angle: _rotationAnimation.value,
                  child: Container(
                    height: 200,
                    width: 200,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(_radiusAnimation.value),
                      color: Colors.white,
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: _rotationAnimation.value + 0.2,
                  child: Container(
                    height: 175,
                    width: 175,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(_radiusAnimation.value),
                      color: const Color.fromARGB(255, 255, 231, 97),
                    ),
                  ),
                ),
                Transform.rotate(
                  angle: _rotationAnimation.value + 0.4,
                  child: Container(
                    height: 125,
                    width: 125,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.circular(_radiusAnimation.value),
                      color: const Color.fromARGB(255, 38, 98, 202),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(50),
                      child: Image.asset(
                        'assets/iugb1.jpeg',
                        fit: BoxFit.cover,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  // Function to navigate to AdminHomePage
  void start(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (BuildContext context) => TeacherPage(),
      ),
    );
  }
}
