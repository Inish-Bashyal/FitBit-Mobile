import 'package:flutter/material.dart';

Widget customTextField(TextEditingController controller, String text) {
  return TextFormField(
    style: const TextStyle(color: Colors.black),
    controller: controller,
    decoration: InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      labelText: text,
      labelStyle: const TextStyle(color: Colors.black),
      filled: true,
      fillColor: const Color.fromARGB(255, 208, 190, 190),
    ),
  );
}

//-----------------------
  //  TextFormField(
  //                     style: const TextStyle(
  //                       color: Colors.black,
  //                     ),
  //                     controller: usernameController,
  //                     decoration: const InputDecoration(
  //                       border: OutlineInputBorder(
  //                         borderRadius: BorderRadius.all(Radius.circular(10)),
  //                       ),
  //                       labelStyle: TextStyle(color: Colors.black),
  //                       labelText: 'Username',
  //                       filled: true,
  //                       fillColor: Color.fromARGB(255, 208, 190, 190),
  //                     ),
  //                   ),
