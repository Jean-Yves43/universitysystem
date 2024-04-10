import 'package:flutter/material.dart';

class MySquare extends StatelessWidget {
  // ignore: prefer_const_constructors_in_immutables
  MySquare({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      color: Colors.blueAccent,
    );
  }
}
