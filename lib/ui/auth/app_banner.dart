//import 'dart:math';

import 'package:flutter/material.dart';

class AppBanner extends StatelessWidget {
  const AppBanner({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 50.0),
      padding: const EdgeInsets.symmetric(
        vertical: 10.0,
        horizontal: 50,
      ),
      //transform: Matrix4.rotationZ(-8 * pi / 180)..translate(-10.0),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(20),
        color: const Color.fromARGB(255, 60, 21, 0),
        boxShadow: const [
          BoxShadow(
            blurRadius: 8,
            color: Colors.grey,
            offset: Offset(0, 2),
          )
        ],
      ),
      child: const Text(
        'Puffin Coffee',
        style: TextStyle(
          color: Colors.white,
          //color: Colors.white,
          fontSize: 35,
          fontFamily: 'Anton',
          wordSpacing: 5,
          letterSpacing: 3,
          fontWeight: FontWeight.normal,
          //decorationColor: Colors.white,
        ),
      ),
    );
  }
}
