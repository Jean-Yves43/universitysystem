import 'package:flutter/material.dart';
import 'package:university_management/screens/login_pageAdmin.dart';
import 'package:university_management/screens/login_pageStudent.dart';
import 'package:university_management/screens/login_pageTeacher.dart';

class ItemDashboard extends StatelessWidget {
  final String title, image;
  const ItemDashboard({Key? key, required this.title, required this.image})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        showDialog(
          context: context,
          builder: (context) => AlertDialog(
            title: Text('Dear $title, please login'),
            content: Image.asset(image, height: 200),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the AlertDialog
                  if (title == 'Admin') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPageAdmin()),
                    );
                  } else if (title == 'Teacher') {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => LoginPageStudent()),
                    );
                  } else {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => LoginPage()),
                    );
                  }
                },
                child: const Text('OK'),
              )
            ],
          ),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              offset: const Offset(0, 5),
              color: Theme.of(context).colorScheme.primary.withOpacity(.2),
              spreadRadius: 2,
              blurRadius: 5,
            )
          ],
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(image, height: 60, fit: BoxFit.cover),
            const SizedBox(height: 10),
            Text(title, style: Theme.of(context).textTheme.headline6),
          ],
        ),
      ),
    );
  }
}
