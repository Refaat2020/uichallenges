import 'package:flutter/material.dart';

class Nescaffe extends StatefulWidget {
  @override
  _NescaffeState createState() => _NescaffeState();
}

class _NescaffeState extends State<Nescaffe> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(image: AssetImage("res/abo.jpeg"))
      ),
      child: Text("Nescaffe"),
    );
  }
}
