import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';

Widget cardView(
  String location,
  String title,
  String description,
  BuildContext context,
) {
  return GestureDetector(
    onTap: () {
      MotionToast.success(description: Text("$title is clicked")).show(context);
    },
    child: SizedBox(
      child: Card(
        elevation: 5,
        color: const Color.fromARGB(255, 112, 110, 110),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          children: [
            Image.asset(
              location,
              width: 200,
              height: 200,
              fit: BoxFit.cover,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: const TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                description,
                style: const TextStyle(fontSize: 16),
              ),
            ),
          ],
        ),
      ),
    ),
  );
}
